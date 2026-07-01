# Change management

Change management is how changes across the hybrid estate are proposed, assessed,
approved, and deployed. It makes change predictable and reversible on both sides
of the boundary, and it accounts for tenant-level changes whose blast radius can
be organization-wide.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

The change process for on-premises and cloud, change categories, the approval
path, and the records kept. Tenant-wide settings — Conditional Access,
synchronization, and directory roles — receive extra scrutiny because they affect
every user at once.

## Change categories

| Category | Definition | Approval | Example |
|----------|------------|----------|---------|
| _Standard_ | _Pre-approved, low-risk, repeatable_ | _Pre-authorized_ | _Routine patch cycle_ |
| _Normal_ | _Assessed and approved individually_ | _Change owner + peer_ | _New Intune profile_ |
| _Tenant-wide_ | _Affects all users organization-wide_ | _Change board + security_ | _Conditional Access change_ |
| _Emergency_ | _Needed to restore or protect service_ | _Expedited, retro-documented_ | _Out-of-band patch_ |

## Change process

1. **Propose** the change with its purpose, scope, risk, and rollback plan.
2. **Assess** the impact and blast radius, identifying affected services from the
   [service dependencies](01-architecture-and-inventory.md), including
   cross-boundary effects.
3. **Approve** per the category's approval path; tenant-wide changes require
   security review.
4. **Schedule** into an agreed change window.
5. **Deploy** following the relevant runbook, with verification and rollback
   ready. For tenant-wide policy, stage in report-only mode first.
6. **Review** the outcome and close the change record.

## Tenant-wide change safeguards

- Always keep break-glass access working and excluded from access policy.
- Stage Conditional Access and synchronization changes before enforcing them.
- Keep a current export of tenant policy for rollback.

## Change record

| Field | Value |
|-------|-------|
| _Change ID_ | _CHG-0000_ |
| _Category_ | _Standard / normal / tenant-wide / emergency_ |
| _Risk_ | _Low / medium / high_ |
| _Rollback plan_ | _Reference to runbook or policy export_ |
| _Outcome_ | _Success / rolled back_ |

## See also

- [Conditional Access and Zero Trust](08-conditional-access-and-zero-trust.md)
- [Maintenance and patching](16-maintenance-and-patching.md)
- [Incident response and escalation](18-incident-response-and-escalation.md)
