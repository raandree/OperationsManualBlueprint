# Incident response and escalation

This chapter defines how the team responds to incidents: how an incident is
declared, the escalation path as it grows, and the protocol that keeps a complex
response rational under pressure. It is the how-to counterpart to the
[monitoring and alerting](08-monitoring-and-alerting.md) pager playbook.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Incident declaration, severity classification, roles during a response,
escalation, communication, and the handoff to the postmortem process. An incident
is a sequence of related events with the same root cause, handled under this
protocol.

## Severity classification

Severity drives the response-time expectation and who is engaged. Align these
with the [on-call rotation](02-roles-and-responsibilities.md).

| Severity | Definition | Response-time expectation | Escalation |
|----------|------------|---------------------------|------------|
| _Sev 1_ | _Major outage, broad user impact_ | _Immediate_ | _Full escalation path_ |
| _Sev 2_ | _Significant degradation_ | _Minutes_ | _Service owner_ |
| _Sev 3_ | _Minor or contained impact_ | _Hours_ | _Primary on-call_ |

## Incident roles

For complex, multi-team, or open-ended incidents, assign roles so responders
triage and resolve rationally rather than by intuition under stress.

| Role | Responsibility |
|------|----------------|
| _Incident commander_ | _Owns the response and decisions_ |
| _Operations lead_ | _Drives the technical investigation_ |
| _Communications lead_ | _Keeps stakeholders informed_ |
| _Scribe_ | _Records the timeline for the postmortem_ |

## Response procedure

1. **Detect and declare.** Confirm the alert is a real incident and declare a
   severity.
2. **Assemble.** Engage the roles appropriate to the severity, following the
   [escalation contacts](02-roles-and-responsibilities.md).
3. **Stabilize.** Mitigate user impact first, using the runbook mapped to the
   triggering alert.
4. **Communicate.** Provide regular updates on the agreed cadence for the
   severity.
5. **Resolve.** Restore service and confirm health.
6. **Hand off.** Open a [postmortem](15-postmortem.md) for any significant
   incident.

## Escalation path

Escalation is the defined sequence of contacts to involve as an incident grows.
It is listed once, authoritatively, in the
[roles and responsibilities](02-roles-and-responsibilities.md) chapter; this
chapter references it rather than duplicating it.

## Communication

_State the channels used during an incident, the stakeholder groups to update,
the update cadence per severity, and where the incident record is kept._

## See also

- [Monitoring and alerting](08-monitoring-and-alerting.md)
- [Postmortem](15-postmortem.md)
- [Roles and responsibilities](02-roles-and-responsibilities.md)
