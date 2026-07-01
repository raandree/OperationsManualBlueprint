# Maintenance and patching

This chapter defines how the estate is kept current: the patch cadence, the
change windows, and the runbooks for applying updates with minimal risk.
Consistent, scheduled maintenance is the cheapest way to avoid emergency change.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Operating-system and application patching for servers and clients, the
maintenance calendar, and the deployment rings that stage updates from pilot to
production.

## Patch cadence

| Workload | Cadence | Deployment tool | Change window |
|----------|---------|-----------------|---------------|
| _Servers_ | _Monthly_ | _WSUS / MECM_ | _Saturday 22:00–02:00_ |
| _Clients_ | _Monthly_ | _WSUS / MECM_ | _Rolling by ring_ |
| _Exchange_ | _Per vendor cumulative update_ | _Manual_ | _Planned maintenance_ |

## Deployment rings

Stage updates so problems are found on a small population first. Roles that host
a single-master function (for example, an FSMO holder) are patched last within
their ring.

| Ring | Population | Purpose | Soak time |
|------|-----------|---------|-----------|
| _Pilot_ | _IT and volunteers_ | _Early detection_ | _n days_ |
| _Broad_ | _General fleet_ | _Main rollout_ | _n days_ |
| _Critical_ | _Domain controllers, CA_ | _Last, one at a time_ | _—_ |

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Apply a server patch cycle | Patch servers within a change window | Semi-automated | _Operations team_ |
| Patch domain controllers | Patch DCs safely, one at a time | Manual | _Directory team_ |
| Emergency out-of-band patch | Apply a critical fix outside the cycle | Manual | _Operations team_ |

### Runbook: apply a server patch cycle

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Prerequisites**: an approved change record; a current backup; confirmation
  that the previous ring soaked without issue.
- **Procedure**: notify stakeholders, deploy to the ring, reboot in the agreed
  order, and verify service health before moving to the next ring.
- **Verification**: services return healthy per the
  [monitoring and alerting](08-monitoring-and-alerting.md) chapter, and update
  compliance reflects the new baseline.
- **Rollback**: uninstall the offending update or restore from backup, and record
  the failure for the change review.

## Maintenance calendar

_Publish the recurring maintenance windows and any freeze periods (for example,
month-end or peak-season change freezes)._

## See also

- [Change management](13-change-management.md)
- [Windows client enterprise](07-windows-client-enterprise.md)
- [Routine operations](09-routine-operations.md)
