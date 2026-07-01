# Hybrid identity

Hybrid identity connects the on-premises Active Directory to the Microsoft Entra
tenant so that users have one identity across both. This chapter describes the
synchronization and authentication design and the runbooks for keeping identities
flowing, because a synchronization failure silently diverges the two directories.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Identity lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Directory synchronization (the sync engine and its scope), the authentication
method, single sign-on, and the writeback features in use. The on-premises source
of authority is covered in the
[Active Directory Domain Services](03-active-directory-domain-services.md)
chapter.

## Synchronization design

| Property | Value |
|----------|-------|
| Sync tool | _Entra Connect / Entra Cloud Sync_ |
| Sync server(s) | _AADC-01 (and staging server)_ |
| Sync interval | _30 minutes (default)_ |
| Synchronized objects | _Users, groups, devices in scope_ |
| Source anchor | _ms-DS-ConsistencyGuid_ |

## Authentication method

State the authentication method and its implications for resilience. Each method
behaves differently when the on-premises estate or the sync server is unavailable.

| Method | In use | Notes |
|--------|--------|-------|
| _Password hash synchronization (PHS)_ | _Yes / no_ | _Resilient to on-premises outage_ |
| _Pass-through authentication (PTA)_ | _Yes / no_ | _Requires on-premises agents_ |
| _Federation_ | _Yes / no_ | _Requires the federation service_ |
| _Seamless single sign-on_ | _Yes / no_ | _—_ |

## Writeback

Record which writeback features are enabled (for example, password writeback and
device writeback) and what each one depends on.

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Check synchronization health | Confirm sync cycles complete without error | Semi-automated | _Identity team_ |
| Force a synchronization cycle | Trigger an on-demand sync | Semi-automated | _Identity team_ |
| Fail over to the staging server | Promote the staging sync server | Manual | _Identity team_ |
| Investigate a sync error | Diagnose an object that fails to sync | Manual | _Identity team_ |

### Runbook: check synchronization health

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Purpose**: confirm identities are flowing from Active Directory to the tenant.
- **Procedure**:

  ```powershell
  # On the sync server
  Get-ADSyncScheduler
  Import-Module ADSync
  # Review the most recent run profile results in the Synchronization Service
  ```

- **Verification**: the scheduler is enabled, the last cycle completed without
  errors, and object counts match expectations.
- **Escalation**: if synchronization is down, assess authentication impact from
  the method table above and escalate per the
  [escalation contacts](02-roles-and-responsibilities.md).

## Monitoring hooks

Map to responses in the [monitoring and alerting](12-monitoring-and-alerting.md)
chapter: sync cycle failures, sync latency, authentication-agent health (for
pass-through authentication), and Entra Connect Health alerts.

## See also

- [Active Directory Domain Services](03-active-directory-domain-services.md)
- [Microsoft Entra tenant](06-entra-id-tenant.md)
- [Conditional Access and Zero Trust](08-conditional-access-and-zero-trust.md)
