# Security and access management

This chapter describes the access model and the security controls that protect
the estate: how privilege is granted and separated, how privileged access is
protected, and how the environment is hardened and audited.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Security lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

The identity and access model, privileged access management, secrets handling,
hardening baselines, and audit. Certificate-based controls are covered in the
[PKI](05-public-key-infrastructure.md) chapter.

## Access model

_Describe how access is granted: role-based groups, the request-and-approval
process, and the joiner-mover-leaver process. State the principle of least
privilege and how it is enforced._

## Administrative tiering

Protect privileged access by separating administration into tiers so that a
compromised workstation cannot yield domain dominance.

| Tier | Controls | Example roles |
|------|----------|---------------|
| _Tier 0_ | _Domain controllers, CA, identity_ | _Domain admins_ |
| _Tier 1_ | _Servers and applications_ | _Server admins_ |
| _Tier 2_ | _Workstations and devices_ | _Helpdesk_ |

State the rules that keep the tiers separate: dedicated administrative accounts,
privileged access workstations, and no credential reuse across tiers.

## Privileged access

| Control | Implementation | Owner |
|---------|----------------|-------|
| _Local admin passwords_ | _Windows LAPS (randomized, rotated)_ | _Security team_ |
| _Just-in-time elevation_ | _Time-bound group membership_ | _Security team_ |
| _Privileged group review_ | _Monthly attestation_ | _Security team_ |

## Secrets management

_Describe how service account credentials, keys, and other secrets are stored,
rotated, and accessed. State the policy on group managed service accounts and the
prohibition on secrets in scripts or documents._

## Hardening baselines

_Reference the security baselines applied to servers and clients (for example,
CIS or Microsoft security baselines) and how compliance is measured and
reported._

## Audit and review

- Privileged group membership is reviewed monthly.
- Security-relevant events are collected centrally and retained per policy.
- Access is recertified on the stated cadence and on every leaver event.

## See also

- [Active Directory Domain Services](03-active-directory-domain-services.md)
- [Public key infrastructure](05-public-key-infrastructure.md)
- [Change management](13-change-management.md)
