# Exchange Server

Exchange Server provides on-premises messaging. This chapter describes the
messaging topology and the runbooks for keeping mail flowing, databases healthy,
and the service recoverable.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Messaging lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Mailbox and transport operations: the database availability group (DAG), mail
flow and connectors, client access, transport queues, and database backup and
recovery. Certificates for Exchange are issued by the
[PKI](05-public-key-infrastructure.md).

## Topology reference

| Property | Value |
|----------|-------|
| Exchange version | _Exchange Server 20xx_ |
| Servers | _list of mailbox / edge servers_ |
| Database availability group | _DAG name and members_ |
| Namespaces | _mail.example.com, autodiscover.example.com_ |
| Outbound connector | _smart host / direct_ |

## Database inventory

| Database | Mounted on | Copies | Backup schedule | Owner |
|----------|------------|--------|-----------------|-------|
| _DB01_ | _EX-HQ-01_ | _2_ | _Nightly full_ | _Messaging team_ |

## Mail flow

_Describe inbound and outbound mail flow, the connectors, the anti-spam and
anti-malware path, and the smart hosts. State the acceptable transport queue
depth before it is treated as an incident._

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Check mail flow health | Confirm inbound and outbound mail is flowing | Semi-automated | _Messaging team_ |
| Clear a stuck transport queue | Diagnose and drain a growing queue | Manual | _Messaging team_ |
| Activate a database copy | Move a database to a healthy DAG member | Semi-automated | _Messaging team_ |
| Renew the Exchange certificate | Replace the TLS certificate before expiry | Semi-automated | _Messaging team_ |

### Runbook: check mail flow health

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Purpose**: confirm mail is flowing and no queue is backing up.
- **Procedure**:

  ```powershell
  # Transport queue depth across the organization
  Get-Queue -Server 'EX-HQ-01' | Sort-Object MessageCount -Descending

  # Database copy health across the DAG
  Get-MailboxDatabaseCopyStatus *
  ```

- **Verification**: queues are draining, all database copies are healthy, and a
  test message delivers end to end.
- **Escalation**: if a queue keeps growing after remediation, escalate per the
  [escalation contacts](02-roles-and-responsibilities.md).

## Monitoring hooks

Map to responses in the [monitoring and alerting](08-monitoring-and-alerting.md)
chapter: transport queue depth, database copy health and replication, disk space
on database and log volumes, service and app-pool availability, and certificate
expiry.

## See also

- [Public key infrastructure](05-public-key-infrastructure.md)
- [Backup and disaster recovery](11-backup-and-disaster-recovery.md)
- [Monitoring and alerting](08-monitoring-and-alerting.md)
