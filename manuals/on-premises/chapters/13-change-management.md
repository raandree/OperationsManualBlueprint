# Change management

Change management is how changes to the estate are proposed, assessed, approved,
and deployed. Its purpose is to make change predictable and reversible, so that
routine work does not become the cause of incidents.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

The change process for the estate: change categories, the approval path, and the
records kept. Standardization here makes routine, ad-hoc, and emergency changes
consistent and predictable.

## Change categories

| Category | Definition | Approval | Example |
|----------|------------|----------|---------|
| _Standard_ | _Pre-approved, low-risk, repeatable_ | _Pre-authorized_ | _Routine patch cycle_ |
| _Normal_ | _Assessed and approved individually_ | _Change owner + peer_ | _New GPO_ |
| _Emergency_ | _Needed to restore or protect service_ | _Expedited, retro-documented_ | _Out-of-band patch_ |

## Change process

1. **Propose** the change with its purpose, scope, risk, and rollback plan.
2. **Assess** the impact and blast radius; identify the affected services from
   the [service dependencies](01-architecture-and-inventory.md).
3. **Approve** per the category's approval path.
4. **Schedule** into an agreed change window from the maintenance calendar.
5. **Deploy** following the relevant runbook, with verification and rollback
   ready.
6. **Review** the outcome and close the change record.

## Change record

Each change is recorded with, at minimum: a unique identifier, the requester and
approver, the risk assessment, the deployment and rollback plans, the change
window, and the outcome. Standard changes may reference a pre-approved template
rather than repeating the assessment.

| Field | Value |
|-------|-------|
| _Change ID_ | _CHG-0000_ |
| _Category_ | _Standard / normal / emergency_ |
| _Risk_ | _Low / medium / high_ |
| _Rollback plan_ | _Reference to runbook_ |
| _Outcome_ | _Success / rolled back_ |

## Emergency change

Emergency change follows the same discipline under time pressure: the roles,
responsibilities, and communication path stay clear, low-risk time-consuming
steps may be skipped only with authorized approval, and the record is completed
immediately after service is restored.

## See also

- [Maintenance and patching](12-maintenance-and-patching.md)
- [Incident response and escalation](14-incident-response-and-escalation.md)
- [Group Policy management](04-group-policy-management.md)
