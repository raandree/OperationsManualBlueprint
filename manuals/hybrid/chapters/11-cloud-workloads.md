# Cloud workloads

This chapter covers the operational management of cloud workloads in the hybrid
estate: infrastructure and platform services on Azure and the Microsoft 365
services in use. It describes the governance model and the runbooks for operating
cloud resources under the shared-responsibility model.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Cloud lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Azure subscriptions and resource organization, infrastructure-as-a-service and
platform-as-a-service workloads, the Microsoft 365 services in use, cost
governance, and resilience. Cloud identity is covered in the
[Microsoft Entra tenant](06-entra-id-tenant.md) chapter.

## Subscription and governance model

| Property | Value |
|----------|-------|
| Management group structure | _—_ |
| Subscriptions | _list with purpose_ |
| Landing zone / naming standard | _—_ |
| Policy (governance) | _Azure Policy assignments_ |
| Tagging standard | _Owner, cost centre, environment_ |

## Workload inventory

| Workload | Type | Subscription | Region | Owner | Criticality |
|----------|------|--------------|--------|-------|-------------|
| _App service_ | _PaaS_ | _—_ | _—_ | _App team_ | _High_ |
| _Virtual machine_ | _IaaS_ | _—_ | _—_ | _App team_ | _Medium_ |

## Governance and cost

- Resources follow the naming and tagging standard so ownership and cost are
  attributable.
- Azure Policy enforces the guardrails; record the assigned policy set.
- Cost is reviewed on a stated cadence against budget, with alerts on overspend.

## Resilience

Record the resilience design per workload: availability zones or regions, scaling,
and the recovery objectives — which are stated authoritatively in the
[backup and disaster recovery](15-backup-and-disaster-recovery.md) chapter.

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Deploy a cloud workload | Provision infrastructure as code | Semi-automated | _Cloud team_ |
| Scale a workload | Adjust capacity to demand | Semi-automated | _Cloud team_ |
| Review cloud cost | Reconcile spend against budget | Manual | _Cloud team_ |
| Investigate a cloud service health event | Respond to a provider-side issue | Manual | _Cloud team_ |

### Runbook: investigate a cloud service health event

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Purpose**: determine whether a workload problem is a provider-side event or a
  local fault.
- **Procedure**: check Azure Service Health for active advisories in the affected
  region and service, correlate with the workload's telemetry, and — if
  provider-side — track the advisory and communicate impact.
- **Escalation**: raise a provider case for a confirmed cloud-side fault per the
  [escalation contacts](02-roles-and-responsibilities.md).

## Monitoring hooks

Map to responses in the [monitoring and alerting](12-monitoring-and-alerting.md)
chapter: resource health, platform metrics and logs, Azure Service Health
advisories, and budget alerts.

## See also

- [Microsoft Entra tenant](06-entra-id-tenant.md)
- [Security and compliance](14-security-and-compliance.md)
- [Backup and disaster recovery](15-backup-and-disaster-recovery.md)
