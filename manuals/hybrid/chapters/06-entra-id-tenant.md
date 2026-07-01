# Microsoft Entra tenant

The Microsoft Entra tenant is the cloud identity plane for the hybrid estate. It
holds the synchronized and cloud-only identities, the application registrations,
and the directory roles that govern cloud administration. This chapter describes
the tenant and the runbooks for operating it.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Identity lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Tenant configuration, directory roles, licensing, application registrations and
enterprise applications, and the operational tasks that keep the tenant healthy.
Synchronization from on-premises is covered in the
[hybrid identity](07-hybrid-identity.md) chapter.

## Tenant reference

| Property | Value |
|----------|-------|
| Tenant name | _example.onmicrosoft.com_ |
| Tenant ID | _GUID_ |
| Verified domains | _example.com_ |
| Licensing | _plan and assigned licenses_ |
| Break-glass accounts | _count and storage of credentials_ |

## Directory roles

Record who holds privileged directory roles and how those roles are governed.
Highly privileged roles should be eligible through privileged identity
management rather than permanently assigned; see
[Conditional Access and Zero Trust](08-conditional-access-and-zero-trust.md).

| Role | Assignment | Governed by | Owner |
|------|------------|-------------|-------|
| _Global Administrator_ | _Eligible (PIM)_ | _Approval + MFA_ | _Identity team_ |
| _Exchange Administrator_ | _Eligible (PIM)_ | _Approval + MFA_ | _Messaging team_ |

## Break-glass accounts

Maintain emergency-access accounts that are excluded from Conditional Access and
whose credentials are stored securely and audited. Test them on a schedule so
they work when normal access fails.

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Review directory role assignments | Attest privileged cloud roles | Semi-automated | _Identity team_ |
| Onboard an enterprise application | Register and consent an application | Manual | _Identity team_ |
| Test break-glass access | Verify emergency accounts work | Manual | _Identity team_ |

### Runbook: review directory role assignments

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Purpose**: confirm only intended principals hold privileged directory roles.
- **Procedure**:

  ```powershell
  # Requires the Microsoft.Graph module and appropriate scopes
  Connect-MgGraph -Scopes 'RoleManagement.Read.Directory'
  Get-MgRoleManagementDirectoryRoleAssignment -All
  ```

- **Verification**: every privileged assignment maps to an approved owner; any
  unexpected assignment is investigated as a security event.

## See also

- [Hybrid identity](07-hybrid-identity.md)
- [Conditional Access and Zero Trust](08-conditional-access-and-zero-trust.md)
- [Security and compliance](14-security-and-compliance.md)
