# Postmortem

A postmortem is a blameless, systematic analysis written after a significant
incident. This chapter defines when a postmortem is required and how the process
runs; the document itself is written from the shared
[postmortem template](../../../templates/postmortem-template.md).

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

The postmortem process: what triggers one, how it is conducted, and how its
action items feed fixes back into runbooks and automation so the same incident
cannot recur silently.

## When a postmortem is required

- Every Sev 1 incident.
- Any incident that breached a recovery objective (RTO or RPO).
- Any incident where the response revealed a gap in runbooks, monitoring, or
  escalation.
- Any near miss the team judges worth learning from.

## Principles

- **Blameless.** Focus on events and systemic causes, not on individuals. People
  act rationally on the information they have; the analysis targets the system
  that produced that information.
- **Evidence-based.** Establish the root cause with evidence from the timeline
  and telemetry, distinguishing the trigger from the deeper condition.
- **Actionable.** Every finding produces a specific, owned, dated action item.

## Process

1. **Assign an author** — usually the incident commander or operations lead.
2. **Draft** the postmortem from the template while details are fresh, using the
   scribe's timeline.
3. **Review** with the responders and service owners to validate the root cause
   and agree action items.
4. **Publish** to the team so the lessons are shared.
5. **Track** action items to completion, feeding fixes back into the affected
   runbooks and automation.

## Action-item follow-through

Action items are tracked to closure and reviewed in the
[routine operations](09-routine-operations.md) monthly checklist. A postmortem is
not closed until its preventive action items are complete or explicitly accepted
as risk.

## See also

- [Postmortem template](../../../templates/postmortem-template.md)
- [Incident response and escalation](14-incident-response-and-escalation.md)
- [Routine operations](09-routine-operations.md)
