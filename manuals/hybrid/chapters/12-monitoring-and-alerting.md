# Monitoring and alerting

This chapter is the pager playbook for the hybrid estate: every alert the team can
receive, from on-premises and cloud sources, mapped to the response for when it
fires. Each actionable alert links to a runbook.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

The monitoring signals collected across on-premises and cloud, the alerts derived
from them, and the response for each. Every actionable alert maps to a runbook; an
alert with no response is noise and should be tuned out.

## Monitoring sources

| Source | Signals | Collected by |
|--------|---------|--------------|
| _Windows Event Log_ | _Directory, transport, security events_ | _Monitoring platform_ |
| _Performance counters_ | _CPU, memory, disk, queue depth_ | _Monitoring platform_ |
| _Entra sign-in and audit logs_ | _Sign-ins, risky sign-ins, changes_ | _Entra / SIEM_ |
| _Entra Connect Health_ | _Sync and authentication health_ | _Entra_ |
| _Azure Monitor_ | _Resource metrics and logs_ | _Azure_ |
| _Service Health_ | _Provider advisories_ | _Microsoft 365 / Azure_ |

## Alert catalogue

Each row maps an alert to its severity and response. Keep severities aligned with
the response-time expectations in the
[roles and responsibilities](02-roles-and-responsibilities.md) chapter.

| Alert | Source | Severity | Threshold | Response runbook |
|-------|--------|----------|-----------|------------------|
| _AD replication failure_ | _Event Log_ | _Sev 2_ | _Any failure_ | _Check replication health_ |
| _Directory sync failure_ | _Entra Connect Health_ | _Sev 2_ | _Cycle failed_ | _Check synchronization health_ |
| _Risky sign-in detected_ | _Entra_ | _Sev 2_ | _High risk_ | _Investigate a risky sign-in_ |
| _Conditional Access lockout_ | _Sign-in logs_ | _Sev 1_ | _Broad denial_ | _Investigate a blocked sign-in_ |
| _Exchange Online mail delay_ | _Service Health_ | _Sev 2_ | _Advisory_ | _Investigate a cloud mail delay_ |
| _Azure resource unhealthy_ | _Azure Monitor_ | _Sev 2_ | _Unhealthy_ | _Investigate a cloud service health event_ |
| _Certificate near expiry_ | _PKI_ | _Sev 3_ | _< 30 days_ | _Renew a service certificate_ |

## Alert quality principles

- Every alert is actionable and maps to a runbook; delete alerts that do not.
- Correlate on-premises and cloud signals so a single incident does not page
  twice under two names.
- Severity drives the response-time expectation, not the reverse.

## Dashboards

_List the operational dashboards across on-premises and cloud, and state the
single dashboard an on-call responder should open first during an incident._

## See also

- [Roles and responsibilities](02-roles-and-responsibilities.md)
- [Incident response and escalation](18-incident-response-and-escalation.md)
- [Hybrid identity](07-hybrid-identity.md)
