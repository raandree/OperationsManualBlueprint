# Conditional Access and Zero Trust

Conditional Access is the policy engine that decides, for each sign-in, whether to
grant access and under what conditions. It is the primary enforcement point for a
Zero Trust posture in the hybrid estate. This chapter describes the policy set and
the discipline for changing it safely, because a careless policy can lock out the
entire organization.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Security lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Conditional Access policy design, multi-factor authentication, device compliance
as an access condition, and privileged identity management. The Zero Trust
principle applied here is: verify explicitly, use least privilege, and assume
breach.

## Policy inventory

Maintain an authoritative list of Conditional Access policies. Every policy states
who it targets, the conditions, and the controls it enforces.

| Policy | Target | Conditions | Controls | State |
|--------|--------|------------|----------|-------|
| _Require MFA for all users_ | _All users_ | _All cloud apps_ | _MFA_ | _On_ |
| _Require compliant device_ | _All users_ | _Cloud apps_ | _Compliant / hybrid-joined_ | _On_ |
| _Block legacy authentication_ | _All users_ | _Legacy clients_ | _Block_ | _On_ |
| _Protect privileged roles_ | _Admin roles_ | _All apps_ | _MFA + PIM_ | _On_ |

## Change discipline

Conditional Access changes carry organization-wide blast radius. Enforce these
rules:

- Always exclude the break-glass accounts from every policy.
- Test new or changed policies in report-only mode before enabling them.
- Change policy only through the [change process](17-change-management.md).
- Keep a current export of all policies for rollback.

## Privileged identity management

Privileged roles are eligible rather than permanently assigned, activated
just-in-time with approval and multi-factor authentication, and time-bound.
Record the roles under privileged identity management and their activation
requirements.

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Change a Conditional Access policy | Modify policy under change control | Manual | _Security team_ |
| Export all Conditional Access policies | Capture policy state for rollback | Semi-automated | _Security team_ |
| Investigate a blocked sign-in | Diagnose why access was denied | Manual | _Security team_ |

### Runbook: change a Conditional Access policy

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Prerequisites**: an approved change record; a current export of all policies;
  break-glass accounts confirmed excluded.
- **Procedure**: create or edit the policy in report-only mode, review the impact
  from sign-in logs, then enable it during the change window.
- **Verification**: sign-in logs show the intended effect and no break-glass or
  emergency path is blocked.
- **Rollback**: restore the previous policy state from the export.

## See also

- [Microsoft Entra tenant](06-entra-id-tenant.md)
- [Security and compliance](14-security-and-compliance.md)
- [Change management](17-change-management.md)
