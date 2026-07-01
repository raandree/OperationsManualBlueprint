# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Memory Bank initialized (`projectbrief`, `activeContext`, `techContext`,
  `systemPatterns`, `progress`, `promptHistory`, `glossary`).
- Research reference `docs/operations-manual-best-practices.md` documenting
  operations-manual best practices, terminology, the Diátaxis framework, the
  seven-section service model, operational-excellence standardization, incident
  and on-call practices, Windows-specific application, existing templates, a
  proposed blueprint scaffolding, and a quality checklist — all cited to five
  authoritative sources.
- Top-level `README.md` describing the blueprint, its two editions, and the
  build.
- Shared templates `templates/runbook-template.md` and
  `templates/postmortem-template.md`.
- On-premises manual edition under `manuals/on-premises/` (17 chapters covering
  Active Directory, Group Policy, PKI, Exchange Server, Windows client, and the
  cross-cutting operational disciplines), with a README and pandoc
  `metadata.yaml`.
- Hybrid manual edition under `manuals/hybrid/` (21 chapters adding the Microsoft
  Entra tenant, hybrid identity, Conditional Access, Exchange hybrid and Exchange
  Online, Intune co-management, and cloud workloads), with a README and pandoc
  `metadata.yaml`.
- Build script `build/build.ps1` that renders each edition to DOCX (pandoc) and
  PDF (a pandoc PDF engine, or LibreOffice as a fallback), with the
  `build/assets/landscape-tables.lua` filter and a `.gitignore` for `dist/`.
