# Roles and responsibilities

This chapter names who owns each service across the on-premises and cloud estate,
who is on-call, and who to contact as an incident grows — including the cloud
provider. It is reference material that the incident response chapter depends on.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Operations lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Service ownership

Every service has exactly one accountable owner, whether it runs on-premises or
in the cloud.

| Service | Accountable owner | Operating team | Backup contact |
|---------|-------------------|----------------|----------------|
| _Active Directory_ | _Directory lead_ | _Directory team_ | _—_ |
| _Entra tenant / hybrid identity_ | _Identity lead_ | _Identity team_ | _—_ |
| _Exchange (hybrid / Online)_ | _Messaging lead_ | _Messaging team_ | _—_ |
| _Endpoint (Intune)_ | _Endpoint lead_ | _Endpoint team_ | _—_ |
| _Cloud workloads_ | _Cloud lead_ | _Cloud team_ | _—_ |
| _Security and compliance_ | _Security lead_ | _Security team_ | _—_ |

## Responsibility matrix

Use a RACI matrix (responsible, accountable, consulted, informed) for
cross-estate activities.

| Activity | Directory | Identity | Messaging | Endpoint | Cloud | Security |
|----------|-----------|----------|-----------|----------|-------|----------|
| _Entra Connect upgrade_ | _C_ | _A/R_ | _I_ | _I_ | _I_ | _C_ |
| _Conditional Access change_ | _I_ | _C_ | _I_ | _C_ | _I_ | _A/R_ |
| _Mailbox migration_ | _I_ | _C_ | _A/R_ | _I_ | _I_ | _I_ |

## On-call rotation

| Tier | Rotation | Response-time expectation | Handoff |
|------|----------|---------------------------|---------|
| _Primary on-call_ | _Weekly_ | _15 minutes (Sev 1)_ | _Monday 09:00_ |
| _Secondary on-call_ | _Weekly_ | _30 minutes_ | _Monday 09:00_ |

## Escalation contacts

The ordered escalation path, including the cloud provider's support channel for
cloud-side faults.

| Order | Role | Name | Contact | When to engage |
|-------|------|------|---------|----------------|
| 1 | _Primary on-call_ | _—_ | _—_ | _First response_ |
| 2 | _Service owner_ | _—_ | _—_ | _Service-specific escalation_ |
| 3 | _Operations lead_ | _—_ | _—_ | _Major incident_ |
| 4 | _Microsoft support_ | _—_ | _Support plan / portal_ | _Suspected cloud-side fault_ |

## Cloud provider responsibility

Record the support plan and the boundary of provider responsibility so responders
know when to raise a provider case rather than continue investigating locally.

| Item | Value |
|------|-------|
| _Support plan_ | _Unified / Premier / Professional_ |
| _Service Health source_ | _Microsoft 365 admin center / Azure Service Health_ |

## See also

- [Incident response and escalation](18-incident-response-and-escalation.md)
- [Architecture and inventory](01-architecture-and-inventory.md)
