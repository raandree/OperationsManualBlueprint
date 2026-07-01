# Active context

## Current focus

Shipped the first full materialization of the blueprint: two operations-manual
editions (on-premises and hybrid), a shared template set, and a PowerShell build
script that renders each edition to DOCX and PDF.

## Recent changes (2026-07-01)

- Added a top-level `README.md` describing the blueprint and the build.
- Added shared templates: `templates/runbook-template.md` and
  `templates/postmortem-template.md`.
- Created the **on-premises** edition (`manuals/on-premises/`) — 17 chapters
  (00–16) covering AD DS, Group Policy, PKI, Exchange Server, Windows client, and
  the cross-cutting operational disciplines — plus a README and `metadata.yaml`.
- Created the **hybrid** edition (`manuals/hybrid/`) — 21 chapters (00–20) adding
  the Entra tenant, hybrid identity, Conditional Access, Exchange hybrid/Online,
  Intune co-management, and cloud workloads — plus a README and `metadata.yaml`.
- Added the build script `build/build.ps1` with
  `build/assets/landscape-tables.lua` and a `.gitignore` for `dist/`.
- Verified: the build script parses clean and is PSScriptAnalyzer-clean; pandoc
  3.9 and LibreOffice produce the DOCX and PDF.
- Added the `origin` remote for GitHub and reset history to a single root commit
  on `main` (not pushed).

## Next steps

1. Teams copy an edition and replace the italic placeholders and reference
   tables with their own values.
2. Optional: add a CI workflow that runs the build and publishes `dist/`
   artifacts.
3. Optional: add a styled `reference.docx` for smaller DOCX table fonts.

## Resolved scope decisions

- Multi-edition (on-premises + hybrid), one Markdown file per chapter, editions
  in separate folders.
- Windows-specific: PowerShell examples and Microsoft tooling baked into the
  templates.
- Templates live under `manuals/<edition>/chapters/` with shared cross-edition
  templates under `templates/`.

## Primary source note

The seven-section service model (Limoncelli) was captured via PagerDuty because
the primary source (opsreportcard.com) returned a 503 at access time. Re-verify
against the primary source when it is reachable.
