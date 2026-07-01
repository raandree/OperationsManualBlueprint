# Glossary (ubiquitous language)

Canonical terminology for the Windows Operations Manual Blueprint. Use only the
terms in the **Term** column in code, templates, documentation, and commits.
Definitions are grounded in the research reference
([operations-manual-best-practices.md](../docs/operations-manual-best-practices.md)).

| Term | Means | Don't say |
|------|-------|-----------|
| Operations manual | The overarching, version-controlled documentation set describing how a service is run; contains runbooks, SOPs, references, and policies. | ops doc, wiki, handbook |
| Runbook | A how-to guide for one commonly repeated operational task or procedure. | procedure doc, script doc, guide |
| Playbook | The big-picture response to a larger issue or event; can orchestrate multiple runbooks and people. | runbook (when it spans many tasks) |
| Standard operating procedure (SOP) | A formalized, repeatable procedure defining how work is done. | process, workflow |
| Checklist | A routine task broken into simple, discrete, repeatable, actionable steps. | task list, to-do |
| Escalation path | The defined sequence of contacts and teams to involve as an incident grows. | call chain, phone tree |
| On-call | The rotation of being available to respond to production alerts within an agreed response time. | standby, duty |
| Incident | A sequence of related events/alerts with the same root cause, handled under the incident protocol. | outage (unless total), issue, ticket |
| Postmortem | A blameless, systematic analysis written after a significant incident, focused on events not individuals. | retro, blame report, RCA (when informal) |
| Recovery time objective (RTO) | The target maximum time to restore a service after a disruption. | downtime target |
| Recovery point objective (RPO) | The target maximum data loss, expressed as a time window, after a disruption. | data-loss window (informal) |
| Disaster recovery (DR) | The plans and procedures to restore a service after a major failure. | backup plan (DR is broader) |
| Change management | How changes are proposed, approved, and deployed. | change control (unless the org's formal name) |

## Rules

- Introduce a new concept only by proposing a new row here first; do not invent a
  synonym.
- If a prompt uses a forbidden synonym, translate it to the canonical term and
  note the translation once.
