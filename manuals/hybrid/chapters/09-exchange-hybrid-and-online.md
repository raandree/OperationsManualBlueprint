# Exchange hybrid and Exchange Online

This chapter covers messaging in a hybrid configuration: mailboxes that may live
on-premises or in Exchange Online, unified mail flow across the two, and the
migration path between them. It describes the topology and the runbooks for
operating messaging across the boundary.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Messaging lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

The Exchange hybrid configuration, mail flow and connectors between on-premises
and the cloud, mailbox migration, and Exchange Online operations. On-premises
mailbox database operations are as described for Exchange Server; this chapter
adds the hybrid and cloud dimensions.

## Topology reference

| Property | Value |
|----------|-------|
| Exchange on-premises version | _Exchange Server 20xx_ |
| Hybrid configuration | _Classic / modern_ |
| Mail flow | _Centralized / direct_ |
| Migration endpoint | _—_ |
| Namespaces | _mail.example.com, autodiscover.example.com_ |

## Mailbox location

Record where mailboxes live and the plan for any remaining migration. During a
migration, mail flow and free/busy must work across both estates.

| Population | Location | Notes |
|------------|----------|-------|
| _Head office_ | _Exchange Online_ | _Migrated_ |
| _Legacy_ | _On-premises_ | _Pending migration_ |

## Mail flow

_Describe inbound and outbound routing across the hybrid boundary, the
connectors, and the anti-spam and anti-malware path. State the acceptable
transport queue depth on-premises before it is treated as an incident, and where
cloud mail-flow health is monitored._

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Check hybrid mail flow | Confirm mail flows both directions | Semi-automated | _Messaging team_ |
| Migrate a mailbox to Exchange Online | Move a mailbox to the cloud | Semi-automated | _Messaging team_ |
| Investigate a cloud mail delay | Diagnose delivery latency in Exchange Online | Manual | _Messaging team_ |
| Renew the hybrid certificate | Replace the hybrid TLS certificate | Semi-automated | _Messaging team_ |

### Runbook: check hybrid mail flow

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Purpose**: confirm mail flows correctly between on-premises and Exchange
  Online.
- **Procedure**:

  ```powershell
  # On-premises transport queues
  Get-Queue -Server 'EX-HQ-01' | Sort-Object MessageCount -Descending

  # Exchange Online message trace (requires the Exchange Online module)
  Connect-ExchangeOnline
  Get-MessageTrace -StartDate (Get-Date).AddHours(-1) -EndDate (Get-Date)
  ```

- **Verification**: a test message delivers in both directions and no queue is
  backing up.
- **Escalation**: for a suspected cloud-side fault, check Service Health and
  raise a provider case per the
  [escalation contacts](02-roles-and-responsibilities.md).

## Monitoring hooks

Map to responses in the [monitoring and alerting](12-monitoring-and-alerting.md)
chapter: on-premises transport queues, hybrid connector health, Exchange Online
Service Health, and hybrid certificate expiry.

## See also

- [Public key infrastructure](05-public-key-infrastructure.md)
- [Cloud workloads](11-cloud-workloads.md)
- [Backup and disaster recovery](15-backup-and-disaster-recovery.md)
