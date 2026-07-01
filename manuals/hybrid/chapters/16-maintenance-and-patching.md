# Maintenance and patching

This chapter defines how the hybrid estate is kept current across servers,
clients, and cloud: the patch cadence, the deployment rings, and the runbooks for
applying updates with minimal risk. Cloud-managed devices and cloud workloads add
update mechanisms beyond the on-premises tooling.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Operating-system and application patching for on-premises servers, update
management for clients through both the configuration manager and Intune update
rings, and update management for cloud workloads.

## Patch cadence

| Workload | Cadence | Deployment tool | Change window |
|----------|---------|-----------------|---------------|
| _On-premises servers_ | _Monthly_ | _WSUS / MECM_ | _Saturday 22:00–02:00_ |
| _Managed clients_ | _Monthly_ | _Intune update rings_ | _Rolling by ring_ |
| _Azure virtual machines_ | _Monthly_ | _Azure Update Manager_ | _Maintenance window_ |
| _Exchange on-premises_ | _Per cumulative update_ | _Manual_ | _Planned maintenance_ |

## Deployment rings

Stage updates so problems surface on a small population first. Domain controllers
and other single-master roles are patched last, one at a time.

| Ring | Population | Tool | Soak time |
|------|-----------|------|-----------|
| _Pilot_ | _IT and volunteers_ | _Intune / MECM_ | _n days_ |
| _Broad_ | _General fleet_ | _Intune / MECM_ | _n days_ |
| _Critical servers_ | _Domain controllers, CA_ | _MECM_ | _—_ |

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Apply a server patch cycle | Patch on-premises servers in a window | Semi-automated | _Operations team_ |
| Release an Intune update ring | Advance a client update ring | Semi-automated | _Endpoint team_ |
| Patch Azure virtual machines | Apply updates via Azure Update Manager | Semi-automated | _Cloud team_ |
| Emergency out-of-band patch | Apply a critical fix outside the cycle | Manual | _Operations team_ |

### Runbook: apply a server patch cycle

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Prerequisites**: an approved change record; a current backup; confirmation the
  previous ring soaked without issue.
- **Procedure**: notify stakeholders, deploy to the ring, reboot in the agreed
  order, and verify service health before the next ring.
- **Verification**: services return healthy per the
  [monitoring and alerting](12-monitoring-and-alerting.md) chapter and compliance
  reflects the new baseline.
- **Rollback**: uninstall the offending update or restore from backup, and record
  the failure for the change review.

## Maintenance calendar

_Publish the recurring maintenance windows and any freeze periods across
on-premises and cloud._

## See also

- [Endpoint management and co-management](10-endpoint-management-intune-comanagement.md)
- [Change management](17-change-management.md)
- [Routine operations](13-routine-operations.md)
