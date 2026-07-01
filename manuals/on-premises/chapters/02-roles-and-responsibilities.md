# Roles and responsibilities

This chapter names who owns each service, who is on-call, and who to contact as an
incident grows. It is reference material: keep it factual and current, because the
incident response chapter depends on these contacts and escalation paths.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Service ownership

Every service has exactly one accountable owner. Ownership means accountability
for the service's health, documentation, and runbooks.

| Service | Accountable owner | Operating team | Backup contact |
|---------|-------------------|----------------|----------------|
| _Active Directory_ | _Directory lead_ | _Directory team_ | _—_ |
| _Exchange Server_ | _Messaging lead_ | _Messaging team_ | _—_ |
| _PKI (AD CS)_ | _Security lead_ | _Security team_ | _—_ |
| _Windows client_ | _Endpoint lead_ | _Endpoint team_ | _—_ |

## Responsibility matrix

Use a RACI matrix (responsible, accountable, consulted, informed) to remove
ambiguity for cross-team activities.

| Activity | Directory | Messaging | Security | Endpoint |
|----------|-----------|-----------|----------|----------|
| _Forest recovery_ | _A/R_ | _I_ | _C_ | _I_ |
| _Certificate authority renewal_ | _C_ | _I_ | _A/R_ | _I_ |
| _Client patch ring release_ | _I_ | _I_ | _C_ | _A/R_ |

## On-call rotation

Describe the on-call model: who is in the rotation, the schedule, and the agreed
response-time expectation by severity.

| Tier | Rotation | Response-time expectation | Handoff |
|------|----------|---------------------------|---------|
| _Primary on-call_ | _Weekly_ | _15 minutes (Sev 1)_ | _Monday 09:00_ |
| _Secondary on-call_ | _Weekly_ | _30 minutes_ | _Monday 09:00_ |

## Escalation contacts

The ordered escalation path. The incident response chapter references this table
when an incident exceeds the primary responder's ability to resolve it.

| Order | Role | Name | Contact | When to engage |
|-------|------|------|---------|----------------|
| 1 | _Primary on-call_ | _—_ | _—_ | _First response_ |
| 2 | _Service owner_ | _—_ | _—_ | _Service-specific escalation_ |
| 3 | _Operations lead_ | _—_ | _—_ | _Major incident_ |
| 4 | _Vendor / external_ | _—_ | _—_ | _Product defect or outage_ |

## See also

- [Incident response and escalation](14-incident-response-and-escalation.md)
- [Architecture and inventory](01-architecture-and-inventory.md)
