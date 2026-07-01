# Routine operations

Routine operations are the recurring checks that keep the estate healthy and
catch problems before they become incidents. This chapter collects them as
actionable checklists on a daily, weekly, and monthly cadence.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

The scheduled operational checklists. Each item is a simple, discrete, repeatable
step, and points to the runbook that handles any failure it uncovers.

## Daily checklist

- [ ] Review overnight alerts and confirm each was actioned or is being worked.
- [ ] Confirm all backup jobs from the previous night succeeded.
- [ ] Check Active Directory replication health across all domain controllers.
- [ ] Check Exchange transport queues are within the expected depth.
- [ ] Review free disk space on all monitored volumes.

## Weekly checklist

- [ ] Review the critical certificate register for upcoming expiries.
- [ ] Confirm client update compliance meets the target threshold.
- [ ] Review capacity trends (disk, memory) against thresholds.
- [ ] Confirm the disaster recovery site is reachable and replicating.
- [ ] Triage and action low-severity alerts that were deferred.

## Monthly checklist

- [ ] Reconcile the [server inventory](01-architecture-and-inventory.md) against
      reality.
- [ ] Review privileged group membership for unexpected changes.
- [ ] Test-restore a sample from backup to prove recoverability.
- [ ] Review and close out open postmortem action items.
- [ ] Review alert quality and retire noisy alerts.

## Handover

_State how the on-call handover works: what the outgoing responder records, where
they record it, and what the incoming responder confirms at the start of a
shift._

## See also

- [Monitoring and alerting](08-monitoring-and-alerting.md)
- [Maintenance and patching](12-maintenance-and-patching.md)
- [Backup and disaster recovery](11-backup-and-disaster-recovery.md)
