# Tech context

## Deliverable format

- **Markdown** (CommonMark / GitHub Flavored Markdown) for all blueprint content
  and templates.
- Structure follows the **Diátaxis** framework (tutorial, how-to, reference,
  explanation).

## Tooling

- **Git** for version control (repository initialized 2026-07-01).
- **VS Code** as the authoring environment.
- Windows operations toolchain referenced by templates: **PowerShell** (scripted
  runbooks), **Desired State Configuration (DSC)** and **MECM/SCCM**
  (configuration management / automation), Windows **Event Log** and performance
  counters (monitoring inputs).

## Conventions

- Markdown authored per the workspace `markdown` instructions (one H1,
  sentence-case headings, no trailing punctuation on headings, ~80-col prose,
  single trailing newline).
- `CHANGELOG.md` per **Keep a Changelog 1.1.0**.
- Versioning per **Semantic Versioning 2.0.0**; project is in initial
  development (`0.y.z`).
- Documentation is treated as a **living asset**: version-controlled, with
  authorship and review dates and a scheduled review cadence.

## Constraints

- Every best-practice claim in reference material must be cited to a primary or
  authoritative source.
- No remote configured yet; commits are local only until a remote is added and
  the owner authorizes a push.
