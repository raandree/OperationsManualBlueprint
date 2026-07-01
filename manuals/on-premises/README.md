# On-premises operations manual

The on-premises edition of the Windows operations manual blueprint. It covers a
self-contained Windows Server estate: Active Directory Domain Services, Group
Policy, a public key infrastructure built on Active Directory Certificate
Services, Exchange Server, and enterprise Windows client management.

Fill in every _italic placeholder_ and each reference table with the details of
your environment. Keep the document-control table at the top of each chapter
current so the manual stays a living asset.

## Chapter index

| # | Chapter | Purpose |
|---|---------|---------|
| 00 | [Introduction](chapters/00-introduction.md) | Purpose, scope, audience, conventions, document control. |
| 01 | [Architecture and inventory](chapters/01-architecture-and-inventory.md) | Topology, sites, and the authoritative asset inventory. |
| 02 | [Roles and responsibilities](chapters/02-roles-and-responsibilities.md) | Ownership, on-call, and escalation contacts. |
| 03 | [Active Directory Domain Services](chapters/03-active-directory-domain-services.md) | Forest and domain operations. |
| 04 | [Group Policy management](chapters/04-group-policy-management.md) | GPO design, change control, and troubleshooting. |
| 05 | [Public key infrastructure](chapters/05-public-key-infrastructure.md) | AD CS certificate authority operations. |
| 06 | [Exchange Server](chapters/06-exchange-server.md) | On-premises messaging operations. |
| 07 | [Windows client enterprise](chapters/07-windows-client-enterprise.md) | Imaging, configuration, and endpoint management. |
| 08 | [Monitoring and alerting](chapters/08-monitoring-and-alerting.md) | The pager playbook: alert-to-response catalogue. |
| 09 | [Routine operations](chapters/09-routine-operations.md) | Daily, weekly, and monthly checklists. |
| 10 | [Security and access management](chapters/10-security-and-access-management.md) | Privileged access, tiering, and hardening. |
| 11 | [Backup and disaster recovery](chapters/11-backup-and-disaster-recovery.md) | Backup regime, RTO/RPO, and recovery procedures. |
| 12 | [Maintenance and patching](chapters/12-maintenance-and-patching.md) | Update cadence and change windows. |
| 13 | [Change management](chapters/13-change-management.md) | How changes are proposed, approved, and deployed. |
| 14 | [Incident response and escalation](chapters/14-incident-response-and-escalation.md) | Escalation paths and the incident protocol. |
| 15 | [Postmortem](chapters/15-postmortem.md) | The blameless postmortem process. |
| 16 | [Appendices](chapters/16-appendices.md) | Glossary, contacts, and references. |

## Building this edition

From the repository root:

```powershell
./build/build.ps1 -Manual on-premises
```

See the [top-level README](../../README.md) for build prerequisites.

## See also

- [Hybrid edition](../hybrid/README.md)
- [Runbook template](../../templates/runbook-template.md)
- [Operations manual best practices](../../docs/operations-manual-best-practices.md)
