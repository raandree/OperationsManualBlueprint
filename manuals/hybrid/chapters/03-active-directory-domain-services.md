# Active Directory Domain Services

Active Directory Domain Services remains the on-premises identity foundation and,
in a hybrid estate, the source of authority for hybrid identity: objects created
here synchronize to the Microsoft Entra tenant. This chapter describes the
directory and the runbooks for operating it safely.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Directory lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Forest and domain operations: domain controllers, replication, DNS, the Flexible
Single Master Operation (FSMO) roles, and the organizational unit design that
determines which objects synchronize to Entra. Synchronization itself is covered
in the [hybrid identity](07-hybrid-identity.md) chapter.

## Forest and domain reference

| Property | Value |
|----------|-------|
| Forest root domain | _corp.example.com_ |
| Forest functional level | _Windows Server 20xx_ |
| Domain functional level | _Windows Server 20xx_ |
| Synchronized to tenant | _example.onmicrosoft.com_ |
| Number of domain controllers | _n_ |

## Domain controller inventory

| Hostname | Site | FSMO roles | Global catalog | DNS | OS version |
|----------|------|------------|----------------|-----|------------|
| _DC-HQ-01_ | _HQ_ | _PDC, RID, Infra_ | _Yes_ | _Yes_ | _Windows Server 20xx_ |
| _DC-DR-01_ | _DR_ | _Schema, Domain naming_ | _Yes_ | _Yes_ | _Windows Server 20xx_ |

## Organizational unit design and sync scope

_Describe the OU structure, the delegation model, and — critically for hybrid —
which organizational units are in the synchronization scope. Objects outside the
sync scope do not appear in the tenant; state the rule explicitly._

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Check replication health | Confirm all domain controllers replicate | Semi-automated | _Directory team_ |
| Promote a domain controller | Add a new domain controller to a site | Manual | _Directory team_ |
| Seize or transfer an FSMO role | Move a single-master role after failure | Manual | _Directory team_ |
| Recover a deleted object | Restore an object from the recycle bin | Semi-automated | _Directory team_ |

### Runbook: check replication health

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Purpose**: confirm every domain controller is replicating without error, so
  that directory changes reach both on-premises services and the sync server.
- **Procedure**:

  ```powershell
  repadmin /replsummary
  repadmin /showrepl 'DC-HQ-01'
  ```

- **Verification**: no replication failures, and the largest delta is within the
  expected replication latency.

## Monitoring hooks

Map these signals to responses in the
[monitoring and alerting](12-monitoring-and-alerting.md) chapter: replication
failures, domain controller availability, and directory-service errors — and note
that directory problems propagate to the tenant through synchronization.

## See also

- [Hybrid identity](07-hybrid-identity.md)
- [Group Policy management](04-group-policy-management.md)
- [Backup and disaster recovery](15-backup-and-disaster-recovery.md)
