# Introduction

This operations manual describes how the _organization_ operations team runs its
on-premises Windows Server estate. It is the single, version-controlled source of
truth for who is responsible, what routine and emergency procedures exist, how
the environment is monitored, and how it recovers from failure.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Purpose

This manual exists so that any qualified operator — not only the person who built
a system — can run it safely and consistently. It captures the standard operating
procedures, runbooks, and reference material needed to keep the environment
healthy and to respond to incidents without improvisation.

## Scope

This edition covers the on-premises Windows platform:

- Active Directory Domain Services (the forest, its domains, and directory
  operations).
- Group Policy management.
- The public key infrastructure built on Active Directory Certificate Services.
- Exchange Server messaging.
- Enterprise Windows client provisioning and management.
- The cross-cutting operational disciplines: monitoring, backup and disaster
  recovery, maintenance, change management, and incident response.

Cloud identity and cloud workloads are out of scope for this edition; use the
hybrid edition when the estate is connected to a Microsoft Entra tenant.

## Audience

The primary audience is the operations and infrastructure engineers who run the
environment, including on-call responders. Readers are expected to be competent
Windows administrators; the manual states procedures precisely but does not teach
Windows Server fundamentals.

## How this manual is organized

The manual follows the [Diátaxis](https://diataxis.fr/) framework, which
separates content by the reader's need:

- **How-to guides** (runbooks) tell you how to perform a task.
- **Reference** material states facts you consult, such as inventories and alert
  catalogues.
- **Explanation** gives the rationale behind the architecture.

How-to and reference material are kept strictly separate. Runbooks are
goal-oriented; reference tables are neutral descriptions you look things up in.

## How to use this manual

- Read a chapter's document-control table first to confirm it is current.
- Follow runbooks step by step. If reality differs from the runbook, stop, apply
  judgement, and record the discrepancy so the runbook can be corrected.
- Treat every _italic placeholder_ as a value you must supply for your estate.

## Conventions

- Commands are shown for PowerShell unless stated otherwise.
- Runbooks follow the shared
  [runbook template](../../../templates/runbook-template.md).
- Terminology follows the glossary in the [appendices](16-appendices.md); the
  canonical terms are used consistently throughout.

## Document control

This manual is a living asset. It is stored in version control alongside the
scripts it references, every chapter carries an owner and a last-reviewed date,
and the whole manual is reviewed on the cadence stated in each chapter's control
table. Record notable changes in the repository
[CHANGELOG](../../../CHANGELOG.md).

## See also

- [Architecture and inventory](01-architecture-and-inventory.md)
- [Roles and responsibilities](02-roles-and-responsibilities.md)
