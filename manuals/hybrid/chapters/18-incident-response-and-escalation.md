# Incident response and escalation

This chapter defines how the team responds to incidents across the hybrid estate,
including incidents whose root cause lies with the cloud provider. It is the
how-to counterpart to the [monitoring and alerting](12-monitoring-and-alerting.md)
pager playbook.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Incident declaration, severity classification, roles during a response,
escalation (including to the cloud provider), communication, and the handoff to
the postmortem process. An incident is a sequence of related events with the same
root cause, handled under this protocol.

## Severity classification

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
2. **Locate the fault.** Determine whether the fault is on-premises, in the
   tenant, or provider-side — check Service Health early for cloud symptoms.
3. **Assemble.** Engage the roles appropriate to the severity per the
   [escalation contacts](02-roles-and-responsibilities.md).
4. **Stabilize.** Mitigate user impact first, using the runbook mapped to the
   triggering alert.
5. **Engage the provider** if the fault is cloud-side: raise a case and track the
   advisory.
6. **Communicate** on the agreed cadence for the severity.
7. **Resolve** and confirm health, then **hand off** to a
   [postmortem](19-postmortem.md) for any significant incident.

## Provider-side incidents

When the root cause is a Microsoft 365 or Azure service issue, the team's job
shifts to confirming impact, communicating, and tracking the provider advisory to
resolution. Record the provider case reference in the incident record.

## Escalation path

The escalation path — including Microsoft support — is listed authoritatively in
the [roles and responsibilities](02-roles-and-responsibilities.md) chapter; this
chapter references it rather than duplicating it.

## See also

- [Monitoring and alerting](12-monitoring-and-alerting.md)
- [Postmortem](19-postmortem.md)
- [Roles and responsibilities](02-roles-and-responsibilities.md)
