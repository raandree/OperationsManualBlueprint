# Progress

Chronological log of shipped work. Latest entries first.

## 2026-07-01

- Initialized the Git repository and the Memory Bank.
- Completed initial in-depth web research on operations-manual best practices and
  templates across five authoritative sources (Diátaxis home/reference/how-to,
  Microsoft Azure Well-Architected Operational Excellence landing + OE:02,
  PagerDuty runbooks, Google SRE "Being On-Call").
- Published the research reference
  [operations-manual-best-practices.md](../docs/operations-manual-best-practices.md)
  with full citations and a proposed blueprint scaffolding.
- Seeded the glossary with canonical operations-documentation terminology.
- Materialized the blueprint: a top-level `README.md`, shared templates
  (`runbook-template.md`, `postmortem-template.md`), the on-premises edition (17
  chapters), the hybrid edition (21 chapters), and the `build/build.ps1` DOCX/PDF
  build script with the `landscape-tables.lua` pandoc filter.
- Verified the build end to end: pandoc 3.9 produces the DOCX and LibreOffice
  produces the PDF for both editions; the script parses clean and is
  PSScriptAnalyzer-clean.
- Added the GitHub remote `origin`
  (`https://github.com/raandree/OperationsManualBlueprint.git`) and reset the
  repository to a single root commit on `main` (prior history squashed; not
  pushed).
- Stopped tracking `.memory-bank/promptHistory.md` and added it to `.gitignore`
  so the prompt log stays local.

## What works

- Research base and citations are in place.
- Memory Bank established for continuity.
- Two complete manual editions render to DOCX and PDF via `build/build.ps1`.

## What's left

- Teams fill in the placeholders and reference tables for their estate.
- Optional CI workflow to build and publish `dist/` artifacts.
- Optional styled `reference.docx` for smaller DOCX table fonts.
