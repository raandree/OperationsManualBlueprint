# Appendices

Reference material that supports the rest of the manual: the terminology
glossary, the contact directory, and the external references the practices are
based on.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Glossary

The canonical terms used throughout this manual. Use these terms consistently.

| Term | Means |
|------|-------|
| Operations manual | The overarching, version-controlled documentation set describing how the estate is run. |
| Runbook | A how-to guide for one commonly repeated operational task. |
| Playbook | The big-picture response to a larger event; can orchestrate several runbooks and people. |
| Standard operating procedure (SOP) | A formalized, repeatable procedure defining how work is done. |
| Checklist | A routine task broken into simple, discrete, repeatable, actionable steps. |
| Escalation path | The defined sequence of contacts to involve as an incident grows. |
| On-call | The rotation of being available to respond to alerts within an agreed response time. |
| Incident | A sequence of related events with the same root cause, handled under the incident protocol. |
| Postmortem | A blameless analysis written after a significant incident, focused on events not individuals. |
| Recovery time objective (RTO) | The target maximum time to restore a service after a disruption. |
| Recovery point objective (RPO) | The target maximum data loss, expressed as a time window. |
| Disaster recovery (DR) | The plans and procedures to restore a service after a major failure. |
| Change management | How changes are proposed, approved, and deployed. |

## Contact directory

_Consolidated contacts. Keep this aligned with the_
_[roles and responsibilities](02-roles-and-responsibilities.md) chapter._

| Role | Name | Primary contact | Out-of-hours |
|------|------|-----------------|--------------|
| _Operations lead_ | _—_ | _—_ | _—_ |
| _Directory lead_ | _—_ | _—_ | _—_ |
| _Messaging lead_ | _—_ | _—_ | _—_ |
| _Security lead_ | _—_ | _—_ | _—_ |
| _Endpoint lead_ | _—_ | _—_ | _—_ |

## References

The practices in this manual draw on the following sources; see the repository
[research reference](../../../docs/operations-manual-best-practices.md) for the
full citations.

- Diátaxis — a systematic approach to technical documentation.
- Microsoft Azure Well-Architected Framework — operational excellence.
- Google — *Site Reliability Engineering*, "Being On-Call".
- PagerDuty — runbook and playbook guidance.

## See also

- [Introduction](00-introduction.md)
- [Runbook template](../../../templates/runbook-template.md)
- [Postmortem template](../../../templates/postmortem-template.md)
