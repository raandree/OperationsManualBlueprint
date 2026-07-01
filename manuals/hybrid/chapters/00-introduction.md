# Introduction

This operations manual describes how the _organization_ operations team runs its
hybrid Windows estate: on-premises infrastructure integrated with a Microsoft
Entra tenant and cloud workloads. It is the single, version-controlled source of
truth for who is responsible, what procedures exist, how the environment is
monitored, and how it recovers from failure across both on-premises and cloud.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Purpose

This manual exists so that any qualified operator can run the estate safely and
consistently across the on-premises and cloud boundary. It captures the standard
operating procedures, runbooks, and reference material needed to keep both sides
healthy and to respond to incidents without improvisation.

## Scope

This edition covers the full hybrid platform:

- The on-premises Windows platform: Active Directory Domain Services, Group
  Policy, the public key infrastructure, and Exchange Server.
- The Microsoft Entra tenant and hybrid identity: directory synchronization,
  authentication, Conditional Access, and privileged identity.
- Cloud services: Exchange Online, Microsoft Intune and co-management, and cloud
  workloads on Azure and Microsoft 365.
- The cross-cutting operational disciplines: monitoring, backup and disaster
  recovery, maintenance, change management, and incident response, applied across
  both estates.

Use the on-premises edition instead when the estate has no cloud tenant.

## Audience

The primary audience is the operations and infrastructure engineers who run the
hybrid estate, including on-call responders and the identity and cloud teams.
Readers are expected to be competent Windows and Microsoft 365 administrators.

## The shared-responsibility boundary

In a hybrid estate, some components are operated by the team and some by the
cloud provider under a shared-responsibility model. This manual states, for each
service, what the team operates and what depends on the provider — because the
response to an incident differs when the fault lies on the provider's side.

## How this manual is organized

The manual follows the [Diátaxis](https://diataxis.fr/) framework: how-to guides
(runbooks) for tasks, reference material for facts you consult, and explanation
for rationale. How-to and reference material are kept strictly separate.

## How to use this manual

- Read a chapter's document-control table first to confirm it is current.
- Follow runbooks step by step; where reality differs, apply judgement and record
  the discrepancy so the runbook can be corrected.
- Treat every _italic placeholder_ as a value you must supply for your estate.

## Conventions

- Commands are shown for PowerShell (including the Microsoft Graph and Exchange
  Online modules) unless stated otherwise.
- Runbooks follow the shared
  [runbook template](../../../templates/runbook-template.md).
- Terminology follows the glossary in the [appendices](20-appendices.md).

## Document control

This manual is a living asset, stored in version control, with an owner and a
last-reviewed date on every chapter and a defined review cadence. Record notable
changes in the repository [CHANGELOG](../../../CHANGELOG.md).

## See also

- [Architecture and inventory](01-architecture-and-inventory.md)
- [Microsoft Entra tenant](06-entra-id-tenant.md)
- [Hybrid identity](07-hybrid-identity.md)
