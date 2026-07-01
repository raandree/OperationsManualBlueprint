# Endpoint management and co-management

This chapter covers enterprise Windows client management in a hybrid estate, where
devices are managed by an on-premises configuration manager, by Microsoft Intune,
or by both under co-management. It describes the management design and the
runbooks for provisioning and controlling devices across those paths.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Endpoint lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Device join type (hybrid-joined or Entra-joined), Intune enrollment, co-management
workloads, provisioning with Autopilot, compliance policy, and application and
update delivery. The coexistence boundary with Group Policy is described in the
[Group Policy](04-group-policy-management.md) chapter.

## Management design

| Property | Value |
|----------|-------|
| Join type | _Hybrid-joined / Entra-joined_ |
| Enrollment | _Automatic (GPO / Autopilot)_ |
| Co-management | _Enabled / not enabled_ |
| MDM authority | _Intune_ |

## Co-management workloads

When co-management is enabled, each workload is owned by either the configuration
manager or Intune — never both. Record the slider position for each workload.

| Workload | Authority | Notes |
|----------|-----------|-------|
| _Compliance policies_ | _Intune_ | _—_ |
| _Windows Update policies_ | _Intune_ | _Update rings_ |
| _Device configuration_ | _Intune / ConfigMgr_ | _One owner_ |
| _Client apps_ | _ConfigMgr / Intune_ | _One owner_ |

## Compliance policy

Device compliance is an input to [Conditional Access](08-conditional-access-and-zero-trust.md):
non-compliant devices can be blocked from cloud resources. Record the compliance
rules and the grace period before enforcement.

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Provision a device with Autopilot | Deliver a cloud-provisioned device | Semi-automated | _Endpoint team_ |
| Deploy an application via Intune | Publish software to a device group | Semi-automated | _Endpoint team_ |
| Wipe or retire a device | Securely decommission a managed device | Manual | _Endpoint team_ |
| Investigate a non-compliant device | Diagnose why a device fails compliance | Manual | _Endpoint team_ |

### Runbook: provision a device with Autopilot

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Purpose**: bring a new device to the standard configuration through
  Autopilot, enrolled in Intune and (where applicable) hybrid-joined.
- **Verification**: the device completes enrollment, reports compliant, and
  receives the assigned applications and policies.

## Monitoring hooks

Map to responses in the [monitoring and alerting](12-monitoring-and-alerting.md)
chapter: enrollment failures, compliance drift, update-ring status, and app
deployment failures.

## See also

- [Group Policy management](04-group-policy-management.md)
- [Conditional Access and Zero Trust](08-conditional-access-and-zero-trust.md)
- [Maintenance and patching](16-maintenance-and-patching.md)
