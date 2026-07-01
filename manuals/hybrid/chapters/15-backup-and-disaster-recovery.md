# Backup and disaster recovery

This chapter defines how the hybrid estate is backed up and recovered across
on-premises and cloud. It states explicit recovery time and recovery point
objectives per service, and accounts for the shared-responsibility model: the
cloud provider protects the platform, but the team remains responsible for its
own data.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

The backup regime and recovery objectives for on-premises services, cloud
workloads, and Microsoft 365 data, plus the rehearsal schedule that proves the
plans work.

## Recovery objectives

The recovery time objective (RTO) is the target maximum time to restore a
service. The recovery point objective (RPO) is the target maximum data loss,
expressed as a time window.

| Service | RTO | RPO | Backup method | Recovery runbook |
|---------|-----|-----|---------------|------------------|
| _Active Directory_ | _4 h_ | _24 h_ | _System state_ | _Recover a domain controller_ |
| _Hybrid identity (sync)_ | _4 h_ | _n/a_ | _Rebuild / staging server_ | _Fail over the sync server_ |
| _Exchange Online data_ | _—_ | _—_ | _Retention / third-party backup_ | _Restore mailbox data_ |
| _Azure workloads_ | _—_ | _—_ | _Azure Backup / snapshots_ | _Recover a cloud workload_ |
| _File services_ | _4 h_ | _24 h_ | _Nightly full_ | _Restore a file share_ |

## Shared-responsibility note

The cloud provider ensures platform availability and durability, but the team is
responsible for recovering from accidental deletion, corruption, or malicious
action within its own data. State explicitly how Microsoft 365 and Azure data is
protected beyond the provider's native retention.

## Backup regime

| System | Schedule | Retention | Location | Owner |
|--------|----------|-----------|----------|-------|
| _On-premises servers_ | _Nightly full / hourly log_ | _n days_ | _On-site + off-site_ | _Operations team_ |
| _Microsoft 365 data_ | _Continuous / daily_ | _Per policy_ | _Backup service_ | _Messaging team_ |
| _Azure workloads_ | _Per policy_ | _Per policy_ | _Azure Backup vault_ | _Cloud team_ |

## Recovery procedures

Each recoverable service has a runbook following the shared
[runbook template](../../../templates/runbook-template.md): recover a domain
controller, forest recovery, fail over the sync server, restore mailbox data,
recover a cloud workload, and restore a file share.

## Disaster recovery site and cloud resilience

_Describe on-premises DR failover and the cloud resilience design (availability
zones or paired regions). State who declares a disaster and how failover and
failback are coordinated across both estates._

## Rehearsals

| Rehearsal | Frequency | Last run | Outcome |
|-----------|-----------|----------|---------|
| _Restore test_ | _Monthly_ | _YYYY-MM-DD_ | _Pass / fail + notes_ |
| _Forest recovery drill_ | _Annually_ | _YYYY-MM-DD_ | _Pass / fail + notes_ |
| _Cloud failover drill_ | _Annually_ | _YYYY-MM-DD_ | _Pass / fail + notes_ |

## See also

- [Architecture and inventory](01-architecture-and-inventory.md)
- [Cloud workloads](11-cloud-workloads.md)
- [Incident response and escalation](18-incident-response-and-escalation.md)
