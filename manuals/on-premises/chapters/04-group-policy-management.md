# Group Policy management

Group Policy delivers configuration to users and computers across the domain.
This chapter describes the Group Policy Object (GPO) design and the runbooks for
changing policy safely, because an unreviewed policy change can affect every
device at once.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Directory lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

GPO design and naming, linking and precedence, change control for policy, backup
and restore of policy objects, and troubleshooting policy application.

## Design principles

_State the estate's GPO conventions: functional GPOs over monolithic ones, a
clear naming standard, security filtering and WMI filtering usage, and the policy
against setting policy at the domain root except for a small agreed set._

## GPO naming convention

| Element | Convention | Example |
|---------|------------|---------|
| Scope prefix | _`C-` computer, `U-` user_ | _`C-Security-Baseline`_ |
| Purpose | _Descriptive_ | _`U-Drive-Mappings`_ |

## GPO inventory

| GPO name | Linked to | Scope | Purpose | Owner |
|----------|-----------|-------|---------|-------|
| _C-Security-Baseline_ | _Domain / OU_ | _Computers_ | _Security hardening_ | _Security team_ |
| _U-Drive-Mappings_ | _User OU_ | _Users_ | _Mapped drives_ | _Endpoint team_ |

## Precedence and inheritance

_Document how precedence is expected to resolve: OU link order, enforced links,
blocked inheritance, and any loopback processing. List every enforced link and
every block, because these override normal precedence._

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Change a GPO setting | Modify policy under change control | Manual | _Directory team_ |
| Back up all GPOs | Export policy objects for recovery | Semi-automated | _Directory team_ |
| Restore a GPO | Recover a policy object from backup | Semi-automated | _Directory team_ |
| Diagnose policy application | Investigate why a policy did not apply | Manual | _Directory team_ |

### Runbook: change a GPO setting

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Purpose**: change a Group Policy setting through the change process without
  unintended impact.
- **Prerequisites**: an approved change record; membership of the delegated group
  policy administrators group; a current backup of the target GPO.
- **Procedure**:

  ```powershell
  # Back up the target GPO before editing
  Backup-GPO -Name 'C-Security-Baseline' -Path '\\server\gpo-backups'

  # After editing in the console, capture a settings report for the change record
  Get-GPOReport -Name 'C-Security-Baseline' -ReportType Html -Path '.\report.html'
  ```

- **Verification**: run `gpresult /r` on a pilot device and confirm the setting
  applies as intended before wider rollout.
- **Rollback**: restore the pre-change backup with `Restore-GPO`.

## Troubleshooting

Standard diagnostics: `gpresult /r` and `gpresult /h` for resultant set of
policy, the Group Policy operational Event Log, and `gpupdate /force` to trigger
a refresh. Confirm the client can reach a domain controller and that replication
of the policy has completed.

## See also

- [Active Directory Domain Services](03-active-directory-domain-services.md)
- [Windows client enterprise](07-windows-client-enterprise.md)
- [Change management](13-change-management.md)
