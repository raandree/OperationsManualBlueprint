# System patterns

Architectural and structural decisions for the blueprint. These patterns are
derived from the research reference
([operations-manual-best-practices.md](../docs/operations-manual-best-practices.md))
and its cited sources.

## Documentation architecture: Diátaxis

Organize all content by the four Diátaxis modes so readers find the right kind
of material:

- **Tutorial** — learning-oriented (for example, on-call onboarding).
- **How-to guide** — task-oriented (runbooks, procedures).
- **Reference** — information-oriented (inventories, alert catalogues, SLAs).
- **Explanation** — understanding-oriented (architecture rationale).

Keep how-to and reference **strictly separate**: how-to is goal-oriented action;
reference is neutral description.

## Operations manual anatomy

A complete manual contains: service overview and architecture; roles,
responsibilities, and contacts; build and deployment; routine procedures
(runbooks); monitoring and alerting (pager playbook); incident response and
escalation; disaster recovery and backup; maintenance and patching; security and
access; SLA; and change management.

## Runbook pattern

- Each runbook is a **how-to guide**: precise title, purpose, prerequisites,
  ordered actionable steps, verification, rollback, and metadata (owner, last
  review date).
- Runbooks sit on an automation spectrum: **manual → semi-automated → fully
  automated**.
- Consistent naming and headers across all runbooks.

## Living-document pattern

- Version-controlled in the same repository as related scripts.
- Authorship and review dates on every document.
- Scheduled review cadence; highlight changes between revisions.

## Incident and reliability patterns

- Clear escalation paths and a defined incident-management protocol.
- Blameless postmortems after significant incidents, feeding fixes back into
  runbooks and automation.
- Disaster-recovery plans with explicit RTO/RPO, validated by rehearsals.

## Candidate scaffolding

The proposed directory layout lives in the research reference under
"Recommended blueprint scaffolding" and is the starting point for the next
phase.
