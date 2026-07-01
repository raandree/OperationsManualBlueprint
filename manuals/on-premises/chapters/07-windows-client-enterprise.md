# Windows client enterprise

This chapter covers the lifecycle and management of enterprise Windows client
devices: how they are provisioned, configured, kept current, and retired. In this
on-premises edition, management is delivered through domain join, Group Policy,
and an on-premises configuration manager.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Endpoint lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Client provisioning (imaging and enrollment), configuration baselines, software
distribution, update management for clients, and device retirement. Policy that
applies to clients is authored in the
[Group Policy](04-group-policy-management.md) chapter.

## Management stack

| Capability | Delivered by | Notes |
|------------|--------------|-------|
| Domain join | _Active Directory_ | _—_ |
| Configuration | _Group Policy_ | _Security and user experience baselines_ |
| Imaging / deployment | _MECM / MDT_ | _Task sequences_ |
| Software distribution | _MECM_ | _Applications and packages_ |
| Client updates | _WSUS / MECM_ | _See maintenance and patching_ |

## Standard build

_Describe the standard client build: the base image, the applications in the core
build, the security baseline, and the naming and organizational unit placement of
new devices._

## Client configuration baselines

| Baseline | Applies to | Enforced by | Owner |
|----------|-----------|-------------|-------|
| _Security baseline_ | _All clients_ | _Group Policy_ | _Security team_ |
| _Encryption (BitLocker)_ | _All laptops_ | _Group Policy / MECM_ | _Endpoint team_ |

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Provision a new device | Image and enroll a client into management | Semi-automated | _Endpoint team_ |
| Deploy an application | Publish software to a device collection | Semi-automated | _Endpoint team_ |
| Retire a device | Securely decommission and wipe a client | Manual | _Endpoint team_ |
| Recover a BitLocker key | Retrieve a recovery key for a locked device | Manual | _Endpoint team_ |

### Runbook: provision a new device

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Purpose**: bring a new client to the standard build and under management.
- **Procedure**: image with the approved task sequence, join the domain into the
  correct organizational unit, confirm Group Policy applies, and verify the
  device appears in the configuration manager inventory.
- **Verification**: `gpresult /r` shows the expected baselines and the device
  reports as compliant in the management console.

## Monitoring hooks

Map to responses in the [monitoring and alerting](08-monitoring-and-alerting.md)
chapter: client update compliance, encryption compliance, configuration-manager
client health, and anti-malware status.

## See also

- [Group Policy management](04-group-policy-management.md)
- [Maintenance and patching](12-maintenance-and-patching.md)
- [Security and access management](10-security-and-access-management.md)
