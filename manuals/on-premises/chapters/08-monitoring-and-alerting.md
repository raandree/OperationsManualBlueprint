# Monitoring and alerting

This chapter is the pager playbook: every alert the operations team can receive,
mapped to the response for when it fires. It combines reference material (the
alert catalogue) with how-to guidance (the response for each alert), which is why
each alert links to a runbook.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

The monitoring signals collected, the alerts derived from them, and the response
for each alert. Every actionable alert must map to a runbook; an alert with no
response is noise and should be tuned out.

## Monitoring sources

| Source | Signals | Collected by |
|--------|---------|--------------|
| _Windows Event Log_ | _Directory, transport, security events_ | _Monitoring platform_ |
| _Performance counters_ | _CPU, memory, disk, queue depth_ | _Monitoring platform_ |
| _Service health checks_ | _Port and endpoint probes_ | _Monitoring platform_ |
| _Certificate expiry_ | _Days to expiry_ | _PKI / monitoring platform_ |

## Alert catalogue

Each row maps an alert to its severity and response. Keep severities aligned with
the response-time expectations in the
[roles and responsibilities](02-roles-and-responsibilities.md) chapter.

| Alert | Source | Severity | Threshold | Response runbook |
|-------|--------|----------|-----------|------------------|
| _AD replication failure_ | _Event Log_ | _Sev 2_ | _Any failure_ | _Check replication health_ |
| _Domain controller down_ | _Health check_ | _Sev 1_ | _Unreachable_ | _Investigate DC availability_ |
| _Transport queue growing_ | _Counter_ | _Sev 2_ | _> n messages_ | _Clear a stuck transport queue_ |
| _Low disk space_ | _Counter_ | _Sev 2_ | _< n % free_ | _Reclaim disk space_ |
| _Certificate near expiry_ | _PKI_ | _Sev 3_ | _< 30 days_ | _Renew a service certificate_ |
| _Backup job failed_ | _Backup system_ | _Sev 2_ | _Any failure_ | _Investigate failed backup_ |

## Alert quality principles

- Every alert is actionable and maps to a runbook; delete alerts that do not.
- Severity drives the response-time expectation, not the reverse.
- Tune thresholds so that an alert means "a human must act now".
- Review alert volume periodically and retire chronically noisy alerts.

## Dashboards

_List the operational dashboards, what each one shows, and who watches it. State
the single dashboard an on-call responder should open first during an incident._

## See also

- [Roles and responsibilities](02-roles-and-responsibilities.md)
- [Incident response and escalation](14-incident-response-and-escalation.md)
- [Routine operations](09-routine-operations.md)
