# Backup and disaster recovery

This chapter defines how the estate is backed up and how each service is
recovered after a failure. It states explicit recovery time and recovery point
objectives, because a disaster recovery plan without measurable objectives cannot
be validated.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

The backup regime, the recovery objectives per service, the recovery procedures,
and the schedule of recovery rehearsals that prove the plan works.

## Recovery objectives

The recovery time objective (RTO) is the target maximum time to restore a
service. The recovery point objective (RPO) is the target maximum data loss,
expressed as a time window.

| Service | RTO | RPO | Backup method | Recovery runbook |
|---------|-----|-----|---------------|------------------|
| _Active Directory_ | _4 h_ | _24 h_ | _System state_ | _Recover a domain controller_ |
| _Exchange Server_ | _8 h_ | _1 h_ | _DAG + nightly full_ | _Recover a mailbox database_ |
| _PKI (AD CS)_ | _8 h_ | _24 h_ | _CA backup_ | _Recover the certificate authority_ |
| _File services_ | _4 h_ | _24 h_ | _Nightly full_ | _Restore a file share_ |

## Backup regime

| System | Schedule | Retention | Location | Owner |
|--------|----------|-----------|----------|-------|
| _—_ | _Nightly full / hourly log_ | _n days / weeks_ | _On-site + off-site_ | _Operations team_ |

State where backups are stored, how off-site copies are held, and how backup
media or repositories are themselves protected and monitored.

## Recovery procedures

Each recoverable service has a runbook that follows the shared
[runbook template](../../../templates/runbook-template.md).

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Recover a domain controller | Rebuild or restore a failed DC | Manual | _Directory team_ |
| Forest recovery | Recover Active Directory after total loss | Manual | _Directory team_ |
| Recover a mailbox database | Restore an Exchange database | Semi-automated | _Messaging team_ |
| Recover the certificate authority | Restore AD CS and CA keys | Manual | _Security team_ |
| Restore a file share | Restore files from backup | Semi-automated | _Operations team_ |

## Disaster recovery site

_Describe the DR site: what is replicated there, how failover is performed, and
how failback is achieved once the primary site returns. State who declares a
disaster and how._

## Rehearsals

Disaster recovery procedures are only trusted once rehearsed. Schedule and record
rehearsals so the documented procedures are proven before a real incident.

| Rehearsal | Frequency | Last run | Outcome |
|-----------|-----------|----------|---------|
| _Restore test_ | _Monthly_ | _YYYY-MM-DD_ | _Pass / fail + notes_ |
| _Forest recovery drill_ | _Annually_ | _YYYY-MM-DD_ | _Pass / fail + notes_ |

## See also

- [Architecture and inventory](01-architecture-and-inventory.md)
- [Incident response and escalation](14-incident-response-and-escalation.md)
- [Maintenance and patching](12-maintenance-and-patching.md)
