# Group Policy management

Group Policy delivers configuration to domain-joined and hybrid-joined Windows
devices. In a hybrid estate it coexists with cloud policy delivered by Intune, so
this chapter also states how the two are kept from conflicting.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Directory lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

GPO design and naming, linking and precedence, change control for policy, and the
coexistence boundary with Intune configuration profiles for co-managed and
hybrid-joined devices.

## Coexistence with cloud policy

State, per setting area, whether the authoritative source is Group Policy or
Intune. Overlapping settings from both sources cause unpredictable results, so
each workload has one owner.

| Setting area | Authoritative source | Notes |
|--------------|----------------------|-------|
| _Security baseline_ | _Group Policy / Intune_ | _Pick one per co-management workload_ |
| _Endpoint configuration_ | _Intune_ | _For hybrid-joined devices_ |

## GPO inventory

| GPO name | Linked to | Scope | Purpose | Owner |
|----------|-----------|-------|---------|-------|
| _C-Security-Baseline_ | _Domain / OU_ | _Computers_ | _Security hardening_ | _Security team_ |

## Precedence and inheritance

_Document precedence: OU link order, enforced links, blocked inheritance, and
loopback processing. List every enforced link and block. For co-managed devices,
note which workloads have been moved to Intune._

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Change a GPO setting | Modify policy under change control | Manual | _Directory team_ |
| Back up all GPOs | Export policy objects for recovery | Semi-automated | _Directory team_ |
| Move a workload to Intune | Shift a setting area from GPO to Intune | Manual | _Endpoint team_ |

### Runbook: change a GPO setting

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Prerequisites**: an approved change record; a current backup of the target
  GPO; confirmation the setting is not also managed by Intune.
- **Procedure**:

  ```powershell
  Backup-GPO -Name 'C-Security-Baseline' -Path '\\server\gpo-backups'
  Get-GPOReport -Name 'C-Security-Baseline' -ReportType Html -Path '.\report.html'
  ```

- **Verification**: `gpresult /r` on a pilot device shows the intended result and
  no conflict with an Intune profile.
- **Rollback**: restore the pre-change backup with `Restore-GPO`.

## See also

- [Endpoint management and co-management](10-endpoint-management-intune-comanagement.md)
- [Active Directory Domain Services](03-active-directory-domain-services.md)
- [Change management](17-change-management.md)
