# Hybrid operations manual

The hybrid edition of the Windows operations manual blueprint. It covers a
Windows estate that spans on-premises infrastructure and a Microsoft Entra
tenant: everything in the on-premises edition, plus cloud identity, hybrid
identity synchronization, Conditional Access, Exchange hybrid and Exchange
Online, Intune and co-management, and cloud workloads.

Fill in every _italic placeholder_ and each reference table with the details of
your environment. Keep the document-control table at the top of each chapter
current so the manual stays a living asset.

## Chapter index

| # | Chapter | Purpose |
|---|---------|---------|
| 00 | [Introduction](chapters/00-introduction.md) | Purpose, scope, audience, conventions, document control. |
| 01 | [Architecture and inventory](chapters/01-architecture-and-inventory.md) | On-premises, cloud, and hybrid connectivity topology. |
| 02 | [Roles and responsibilities](chapters/02-roles-and-responsibilities.md) | Ownership, on-call, and escalation across on-premises and cloud. |
| 03 | [Active Directory Domain Services](chapters/03-active-directory-domain-services.md) | On-premises directory, the source of authority for hybrid identity. |
| 04 | [Group Policy management](chapters/04-group-policy-management.md) | GPO alongside cloud policy. |
| 05 | [Public key infrastructure](chapters/05-public-key-infrastructure.md) | AD CS with cloud certificate delivery. |
| 06 | [Microsoft Entra tenant](chapters/06-entra-id-tenant.md) | Cloud identity tenant operations. |
| 07 | [Hybrid identity](chapters/07-hybrid-identity.md) | Directory synchronization and authentication. |
| 08 | [Conditional Access and Zero Trust](chapters/08-conditional-access-and-zero-trust.md) | Access policy, MFA, and privileged identity. |
| 09 | [Exchange hybrid and Exchange Online](chapters/09-exchange-hybrid-and-online.md) | Hybrid messaging and cloud mailboxes. |
| 10 | [Endpoint management and co-management](chapters/10-endpoint-management-intune-comanagement.md) | Intune, co-management, and Autopilot. |
| 11 | [Cloud workloads](chapters/11-cloud-workloads.md) | Azure and Microsoft 365 workload operations. |
| 12 | [Monitoring and alerting](chapters/12-monitoring-and-alerting.md) | The pager playbook across on-premises and cloud. |
| 13 | [Routine operations](chapters/13-routine-operations.md) | Daily, weekly, and monthly checklists. |
| 14 | [Security and compliance](chapters/14-security-and-compliance.md) | Cloud and hybrid security and compliance controls. |
| 15 | [Backup and disaster recovery](chapters/15-backup-and-disaster-recovery.md) | Backup regime, RTO/RPO, and recovery across estates. |
| 16 | [Maintenance and patching](chapters/16-maintenance-and-patching.md) | Update cadence across servers, clients, and cloud. |
| 17 | [Change management](chapters/17-change-management.md) | How changes are proposed, approved, and deployed. |
| 18 | [Incident response and escalation](chapters/18-incident-response-and-escalation.md) | Escalation paths, including the cloud provider. |
| 19 | [Postmortem](chapters/19-postmortem.md) | The blameless postmortem process. |
| 20 | [Appendices](chapters/20-appendices.md) | Glossary, contacts, and references. |

## Building this edition

From the repository root:

```powershell
./build/build.ps1 -Manual hybrid
```

See the [top-level README](../../README.md) for build prerequisites.

## See also

- [On-premises edition](../on-premises/README.md)
- [Runbook template](../../templates/runbook-template.md)
- [Operations manual best practices](../../docs/operations-manual-best-practices.md)
