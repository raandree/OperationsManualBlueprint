# Windows operations manual blueprint

A reusable blueprint for authoring operations manuals for Windows enterprise
environments. It ships two ready-to-fill manual editions, a shared set of
templates, and a build script that renders each manual to DOCX and PDF.

The blueprint encodes the practices researched in
[docs/operations-manual-best-practices.md](docs/operations-manual-best-practices.md):
the [Diátaxis](https://diataxis.fr/) documentation framework, the Limoncelli
seven-section service model, Microsoft's Azure Well-Architected operational
excellence guidance, and Google SRE incident practices. Fill in the placeholders,
keep the documents under version control, and review them on the stated cadence.

## The two editions

| Edition | Folder | Covers |
|---------|--------|--------|
| On-premises | [manuals/on-premises](manuals/on-premises/) | Active Directory, Group Policy, PKI (AD CS), Exchange Server, and Windows client enterprise management in a self-contained on-premises estate. |
| Hybrid | [manuals/hybrid](manuals/hybrid/) | Everything in the on-premises edition plus a Microsoft Entra tenant, hybrid identity, Conditional Access, Exchange hybrid and Exchange Online, Intune co-management, and cloud workloads. |

Each edition is self-contained in its own folder so a team can copy just the one
it needs. Every chapter is a separate Markdown file under the edition's
`chapters/` directory, numbered so the order is deterministic.

## Repository layout

```text
README.md                     This file
docs/                         Research reference behind the blueprint
templates/                    Shared, reusable templates
  runbook-template.md         Standard runbook (how-to) template
  postmortem-template.md      Blameless postmortem template
manuals/
  on-premises/                On-premises edition
    README.md                 Edition overview + chapter index
    metadata.yaml             Title/author/date used by the build
    chapters/                 One Markdown file per chapter
  hybrid/                     Hybrid edition (same shape)
build/
  build.ps1                   Renders a manual to DOCX and PDF
  assets/landscape-tables.lua Pandoc filter: wide tables on landscape pages
dist/                         Build output (created on demand, not committed)
```

## How to use the blueprint

1. Pick the edition that matches your estate and copy its folder, or edit it in
   place.
2. Work through the chapters in order. Replace every _italic placeholder_ and
   fill each reference table with your own values.
3. Keep the document-control table at the top of each chapter current — owner,
   last-reviewed date, and review cadence make the manual a living asset.
4. Store the manual in version control alongside the scripts it references.
5. Render distributable copies with the build script below.

## Building DOCX and PDF

The build script converts a manual's chapters into a single DOCX and a single
PDF, with a title page and a table of contents.

```powershell
# Render both editions to both formats into dist/
./build/build.ps1

# Render only the hybrid edition to PDF
./build/build.ps1 -Manual hybrid -Format pdf
```

### Build prerequisites

- **Pandoc** — required for DOCX (and for PDF when a PDF engine is present).
  Install with `winget install JohnMacFarlane.Pandoc`.
- **A PDF path** — the script uses the first available of: a Pandoc PDF engine
  (`wkhtmltopdf`, `weasyprint`, `xelatex`, `lualatex`, `pdflatex`, `tectonic`,
  or `typst`), or **LibreOffice** (`soffice`) to convert the DOCX to PDF. If none
  is found, the script builds the DOCX and skips the PDF with a warning.

Run `./build/build.ps1 -WhatIf` to see what would be produced without
writing any files.

## See also

- [Operations manual best practices](docs/operations-manual-best-practices.md)
- [Runbook template](templates/runbook-template.md)
- [Postmortem template](templates/postmortem-template.md)
- [CHANGELOG](CHANGELOG.md)
