# Routine operations

Routine operations are the recurring checks that keep the hybrid estate healthy on
both sides of the on-premises and cloud boundary. This chapter collects them as
actionable checklists on a daily, weekly, and monthly cadence.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

The scheduled operational checklists across on-premises and cloud. Each item is a
simple, discrete, repeatable step that points to the runbook handling any failure
it uncovers.

## Daily checklist

- [ ] Review overnight alerts from on-premises and cloud sources.
- [ ] Confirm all backup jobs from the previous night succeeded.
- [ ] Check Active Directory replication and directory synchronization health.
- [ ] Review Entra sign-in logs for risky sign-ins and failures.
- [ ] Check Exchange (on-premises queues and Exchange Online Service Health).
- [ ] Review Service Health for active provider advisories.

## Weekly checklist

- [ ] Review the critical certificate register for upcoming expiries.
- [ ] Confirm device compliance and update-ring status in Intune.
- [ ] Review Conditional Access report-only results for pending changes.
- [ ] Review cloud cost against budget.
- [ ] Confirm the disaster recovery site and cloud resilience are healthy.

## Monthly checklist

- [ ] Reconcile the [inventory](01-architecture-and-inventory.md) across
      on-premises and cloud.
- [ ] Review privileged role membership on-premises and in Entra (PIM).
- [ ] Test-restore a sample from backup to prove recoverability.
- [ ] Test break-glass account access.
- [ ] Review the cloud secure score and act on top recommendations.
- [ ] Review and close out open postmortem action items.

## Handover

_State how the on-call handover works across the hybrid estate: what the outgoing
responder records, where, and what the incoming responder confirms — including any
open provider advisories._

## See also

- [Monitoring and alerting](12-monitoring-and-alerting.md)
- [Security and compliance](14-security-and-compliance.md)
- [Maintenance and patching](16-maintenance-and-patching.md)
