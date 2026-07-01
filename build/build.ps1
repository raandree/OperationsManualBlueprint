#Requires -Version 5.1
<#
.SYNOPSIS
    Build the Windows operations manuals into DOCX and PDF.

.DESCRIPTION
    Renders each manual edition (on-premises and hybrid) from its per-chapter
    Markdown files into a single DOCX and a single PDF, each with a title page
    and a table of contents.

    DOCX is produced with pandoc. PDF is produced with the first available of a
    pandoc PDF engine (wkhtmltopdf, weasyprint, typst, tectonic, xelatex,
    lualatex, or pdflatex) or LibreOffice (soffice) converting the DOCX. If no
    PDF path is available, the DOCX is still produced and the PDF is skipped
    with a warning.

.PARAMETER Manual
    Which edition to build: 'on-premises', 'hybrid', or 'all' (the default).

.PARAMETER Format
    Which format to produce: 'docx', 'pdf', or 'all' (the default).

.PARAMETER OutputPath
    Directory for the built files. Defaults to the 'dist' folder at the
    repository root.

.PARAMETER PandocPath
    Full path to pandoc.exe, used when pandoc is not on the PATH.

.PARAMETER SofficePath
    Full path to soffice.exe (LibreOffice), used as the PDF fallback when no
    pandoc PDF engine is present.

.EXAMPLE
    ./build/build.ps1
    Builds both editions to both formats into dist/.

.EXAMPLE
    ./build/build.ps1 -Manual hybrid -Format pdf
    Builds only the hybrid edition as a PDF.

.EXAMPLE
    ./build/build.ps1 -WhatIf
    Shows what would be produced without writing any files.

.NOTES
    Requires pandoc for DOCX. For PDF, requires either a pandoc PDF engine or
    LibreOffice. Install pandoc with 'winget install JohnMacFarlane.Pandoc'.
#>
[CmdletBinding(SupportsShouldProcess)]
[OutputType([System.IO.FileInfo])]
param(
    [Parameter()]
    [ValidateSet('on-premises', 'hybrid', 'all')]
    [string]$Manual = 'all',

    [Parameter()]
    [ValidateSet('docx', 'pdf', 'all')]
    [string]$Format = 'all',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$OutputPath,

    [Parameter()]
    [string]$PandocPath,

    [Parameter()]
    [string]$SofficePath
)

$ErrorActionPreference = 'Stop'

function Resolve-PandocPath {
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [Parameter()]
        [string]$PandocPath
    )

    if ($PandocPath) {
        if (Test-Path -LiteralPath $PandocPath) {
            return (Resolve-Path -LiteralPath $PandocPath).Path
        }
        throw "Pandoc was not found at the specified path: $PandocPath"
    }

    $command = Get-Command -Name 'pandoc' -CommandType Application -ErrorAction SilentlyContinue |
        Select-Object -First 1
    if ($command) {
        return $command.Source
    }

    $fallback = Join-Path -Path $env:LOCALAPPDATA -ChildPath 'Pandoc\pandoc.exe'
    if (Test-Path -LiteralPath $fallback) {
        return $fallback
    }

    throw "Pandoc was not found. Install it with 'winget install JohnMacFarlane.Pandoc' or pass -PandocPath."
}

function Resolve-PdfStrategy {
    [CmdletBinding()]
    [OutputType([hashtable])]
    param(
        [Parameter()]
        [string]$SofficePath
    )

    # Prefer a pandoc PDF engine when one is on the PATH.
    $engines = 'wkhtmltopdf', 'weasyprint', 'typst', 'tectonic', 'xelatex', 'lualatex', 'pdflatex'
    foreach ($engine in $engines) {
        $found = Get-Command -Name $engine -CommandType Application -ErrorAction SilentlyContinue |
            Select-Object -First 1
        if ($found) {
            return @{ Type = 'pandoc'; Engine = $engine; Tool = $found.Source }
        }
    }

    # Fall back to LibreOffice converting the DOCX to PDF.
    $candidates = [System.Collections.Generic.List[string]]::new()
    if ($SofficePath) {
        $candidates.Add($SofficePath)
    }
    $soffice = Get-Command -Name 'soffice' -CommandType Application -ErrorAction SilentlyContinue |
        Select-Object -First 1
    if ($soffice) {
        $candidates.Add($soffice.Source)
    }
    $candidates.Add('C:\Program Files\LibreOffice\program\soffice.exe')
    $candidates.Add('C:\Program Files (x86)\LibreOffice\program\soffice.exe')

    foreach ($candidate in $candidates) {
        if ($candidate -and (Test-Path -LiteralPath $candidate)) {
            return @{ Type = 'soffice'; Path = (Resolve-Path -LiteralPath $candidate).Path }
        }
    }

    return $null
}

function Get-ManualChapter {
    [CmdletBinding()]
    [OutputType([string[]])]
    param(
        [Parameter(Mandatory)]
        [string]$ChaptersPath
    )

    if (-not (Test-Path -LiteralPath $ChaptersPath)) {
        throw "Chapters directory not found: $ChaptersPath"
    }

    $files = Get-ChildItem -LiteralPath $ChaptersPath -Filter '*.md' -File |
        Sort-Object -Property Name
    if (-not $files) {
        throw "No chapter files were found in: $ChaptersPath"
    }

    return [string[]]$files.FullName
}

function Convert-Manual {
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([System.IO.FileInfo])]
    param(
        [Parameter(Mandatory)]
        [string]$Edition,

        [Parameter(Mandatory)]
        [string]$ManualsRoot,

        [Parameter(Mandatory)]
        [string]$OutputPath,

        [Parameter(Mandatory)]
        [string]$Pandoc,

        [Parameter()]
        [hashtable]$PdfStrategy,

        [Parameter(Mandatory)]
        [ValidateSet('docx', 'pdf', 'all')]
        [string]$Format,

        [Parameter()]
        [string]$LuaFilter
    )

    $editionPath = Join-Path -Path $ManualsRoot -ChildPath $Edition
    $chaptersPath = Join-Path -Path $editionPath -ChildPath 'chapters'
    $metadata = Join-Path -Path $editionPath -ChildPath 'metadata.yaml'
    $chapters = Get-ManualChapter -ChaptersPath $chaptersPath

    $buildDocx = $Format -in @('docx', 'all')
    $buildPdf = $Format -in @('pdf', 'all')

    $baseName = "operations-manual-$Edition"
    $docxOut = Join-Path -Path $OutputPath -ChildPath "$baseName.docx"
    $pdfOut = Join-Path -Path $OutputPath -ChildPath "$baseName.pdf"

    # Reader and table-of-contents arguments shared by both formats.
    $commonArgs = @('--from', 'gfm', '--toc', '--toc-depth=2')
    if (Test-Path -LiteralPath $metadata) {
        $commonArgs += @('--metadata-file', $metadata)
    }
    $commonArgs += @('--resource-path', $chaptersPath)

    $usesSoffice = $buildPdf -and $PdfStrategy -and $PdfStrategy.Type -eq 'soffice'
    $docxBuilt = $false
    $docxTarget = $docxOut

    # Build the DOCX when requested, or as an intermediate for the LibreOffice PDF path.
    if ($buildDocx -or $usesSoffice) {
        if (-not $buildDocx) {
            $docxTarget = Join-Path -Path $env:TEMP -ChildPath "$baseName-$([guid]::NewGuid().ToString('N')).docx"
        }

        $docxArgs = @($chapters) + $commonArgs + @('--to', 'docx')
        if ($LuaFilter -and (Test-Path -LiteralPath $LuaFilter)) {
            $docxArgs += @('--lua-filter', $LuaFilter)
        }
        $docxArgs += @('-o', $docxTarget)

        if ($PSCmdlet.ShouldProcess($docxTarget, 'Create DOCX with pandoc')) {
            & $Pandoc @docxArgs
            if ($LASTEXITCODE -ne 0) {
                throw "pandoc failed to build the DOCX for '$Edition' (exit code $LASTEXITCODE)."
            }
            $docxBuilt = $true
            if ($buildDocx) {
                Get-Item -LiteralPath $docxTarget
            }
        }
    }

    if (-not $buildPdf) {
        return
    }

    if (-not $PdfStrategy) {
        Write-Warning "No PDF engine was found; skipping the PDF for '$Edition'. Install a pandoc PDF engine or LibreOffice."
        return
    }

    if ($PdfStrategy.Type -eq 'pandoc') {
        $pdfArgs = @($chapters) + $commonArgs + @('--pdf-engine', $PdfStrategy.Engine, '-o', $pdfOut)
        if ($PSCmdlet.ShouldProcess($pdfOut, "Create PDF with pandoc ($($PdfStrategy.Engine))")) {
            & $Pandoc @pdfArgs
            if ($LASTEXITCODE -ne 0) {
                throw "pandoc failed to build the PDF for '$Edition' (exit code $LASTEXITCODE)."
            }
            Get-Item -LiteralPath $pdfOut
        }
        return
    }

    # LibreOffice path: convert the DOCX intermediate to PDF.
    if ($PSCmdlet.ShouldProcess($pdfOut, 'Create PDF with LibreOffice')) {
        if (-not $docxBuilt) {
            throw "The DOCX intermediate was not built; cannot produce the PDF for '$Edition'."
        }

        # Use an isolated user profile so the conversion runs even when a
        # LibreOffice instance is already open; otherwise soffice forwards the
        # request to the running instance and silently skips the conversion.
        $profileDir = ($env:TEMP -replace '\\', '/').TrimEnd('/')
        $loProfile = "-env:UserInstallation=file:///$profileDir/opsmanual-lo-profile"
        & $PdfStrategy.Path $loProfile '--headless' '--convert-to' 'pdf:writer_pdf_Export' '--outdir' $OutputPath $docxTarget | Out-Null

        # LibreOffice names the output after the input basename and does not
        # return a reliable exit code, so verify the file exists.
        $produced = Join-Path -Path $OutputPath -ChildPath ([System.IO.Path]::GetFileNameWithoutExtension($docxTarget) + '.pdf')
        if (-not (Test-Path -LiteralPath $produced)) {
            throw "LibreOffice did not produce a PDF for '$Edition'. Close any blocking LibreOffice instance, or install a pandoc PDF engine (for example, wkhtmltopdf)."
        }
        if ($produced -ne $pdfOut) {
            Move-Item -LiteralPath $produced -Destination $pdfOut -Force
        }
        Get-Item -LiteralPath $pdfOut
    }

    # Remove the temporary DOCX intermediate when the DOCX was not itself requested.
    if ($usesSoffice -and -not $buildDocx -and (Test-Path -LiteralPath $docxTarget)) {
        Remove-Item -LiteralPath $docxTarget -Force -ErrorAction SilentlyContinue
    }
}

$scriptDir = $PSScriptRoot
$repoRoot = Split-Path -Path $scriptDir -Parent
$manualsRoot = Join-Path -Path $repoRoot -ChildPath 'manuals'
$luaFilter = Join-Path -Path $scriptDir -ChildPath 'assets\landscape-tables.lua'

if (-not $OutputPath) {
    $OutputPath = Join-Path -Path $repoRoot -ChildPath 'dist'
}

$editions = if ($Manual -eq 'all') { @('on-premises', 'hybrid') } else { @($Manual) }

$pandoc = Resolve-PandocPath -PandocPath $PandocPath
Write-Verbose "Using pandoc: $pandoc"

$pdfStrategy = $null
if ($Format -in @('pdf', 'all')) {
    $pdfStrategy = Resolve-PdfStrategy -SofficePath $SofficePath
    if ($pdfStrategy) {
        $description = if ($pdfStrategy.Type -eq 'pandoc') {
            "pandoc engine '$($pdfStrategy.Engine)'"
        }
        else {
            "LibreOffice ($($pdfStrategy.Path))"
        }
        Write-Verbose "PDF strategy: $description"
    }
    else {
        Write-Warning 'No PDF engine was found. DOCX will still be produced; PDF will be skipped.'
    }
}

if (-not (Test-Path -LiteralPath $OutputPath)) {
    if ($PSCmdlet.ShouldProcess($OutputPath, 'Create output directory')) {
        New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
    }
}

foreach ($edition in $editions) {
    Write-Verbose "Building the '$edition' edition..."
    Convert-Manual -Edition $edition -ManualsRoot $manualsRoot -OutputPath $OutputPath `
        -Pandoc $pandoc -PdfStrategy $pdfStrategy -Format $Format -LuaFilter $luaFilter
}
