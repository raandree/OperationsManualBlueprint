# Active Directory Domain Services

Active Directory Domain Services is the identity foundation of the estate: almost
every other service depends on it for authentication, authorization, and DNS.
This chapter describes the directory and provides the runbooks for operating it
safely.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Directory lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Forest and domain operations: domain controllers, replication, DNS, the
Flexible Single Master Operation (FSMO) roles, organizational unit design, and
directory backup and recovery. Group Policy has its own chapter.

## Forest and domain reference

| Property | Value |
|----------|-------|
| Forest root domain | _corp.example.com_ |
| Forest functional level | _Windows Server 20xx_ |
| Domain functional level | _Windows Server 20xx_ |
| Domains | _list_ |
| Number of domain controllers | _n_ |

## Domain controller inventory

| Hostname | Site | FSMO roles | Global catalog | DNS | OS version |
|----------|------|------------|----------------|-----|------------|
| _DC-HQ-01_ | _HQ_ | _PDC, RID, Infra_ | _Yes_ | _Yes_ | _Windows Server 20xx_ |
| _DC-DR-01_ | _DR_ | _Schema, Domain naming_ | _Yes_ | _Yes_ | _Windows Server 20xx_ |

## Organizational unit design

_Describe the OU structure and the delegation model. State where user, group,
computer, and service accounts live, and which team is delegated control of each
branch._

## Replication topology

_Describe the site links, replication schedule, and bridgehead servers. State the
expected replication latency between sites._

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Check replication health | Confirm all domain controllers replicate | Semi-automated | _Directory team_ |
| Promote a domain controller | Add a new domain controller to a site | Manual | _Directory team_ |
| Seize or transfer an FSMO role | Move a single-master role after failure | Manual | _Directory team_ |
| Recover a deleted object | Restore an object from the recycle bin | Semi-automated | _Directory team_ |

### Runbook: check replication health

Follow the shared [runbook template](../../../templates/runbook-template.md). The
outline below is the starting point.

- **Purpose**: confirm that every domain controller is replicating without error.
- **When to use**: daily health check, and after any domain controller change.
- **Procedure**:

  ```powershell
  # Summarize replication status across all domain controllers
  repadmin /replsummary

  # Show replication partners and last success/failure for one DC
  repadmin /showrepl 'DC-HQ-01'
  ```

- **Verification**: `repadmin /replsummary` reports no failures and the largest
  delta is within the expected replication latency.
- **Escalation**: if failures persist after _n_ cycles, escalate to the directory
  lead per the [escalation contacts](02-roles-and-responsibilities.md).

## Monitoring hooks

Map these signals to responses in the
[monitoring and alerting](08-monitoring-and-alerting.md) chapter: replication
failures, domain controller availability, secure-channel health, LSASS and
directory service errors in the Event Log, and free space on the database volume.

## See also

- [Group Policy management](04-group-policy-management.md)
- [Backup and disaster recovery](11-backup-and-disaster-recovery.md)
- [Security and access management](10-security-and-access-management.md)
