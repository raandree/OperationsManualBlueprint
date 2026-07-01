# Security and compliance

This chapter describes the security and compliance controls that protect the
hybrid estate across on-premises and cloud: identity protection, threat
protection, data protection, and the audit and compliance posture. It complements
the access controls in the
[Conditional Access and Zero Trust](08-conditional-access-and-zero-trust.md)
chapter.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Security lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Identity protection, endpoint and cloud threat protection, data protection and
compliance, privileged access, and security monitoring. On-premises tiering and
hardening remain in force and are extended here to the cloud.

## Control catalogue

| Domain | Control | Tooling | Owner |
|--------|---------|---------|-------|
| _Identity protection_ | _Risk-based policy, MFA_ | _Entra Identity Protection_ | _Security team_ |
| _Threat protection_ | _Endpoint and cloud detection_ | _Microsoft Defender XDR_ | _Security team_ |
| _Data protection_ | _Classification, DLP_ | _Microsoft Purview_ | _Security team_ |
| _Privileged access_ | _Just-in-time roles_ | _Entra PIM_ | _Identity team_ |
| _Security monitoring_ | _Correlation and response_ | _SIEM / SOC_ | _Security team_ |

## Administrative tiering

The on-premises tier model (Tier 0/1/2) remains authoritative for on-premises
administration and is extended to cloud roles: cloud privileged roles are treated
as Tier 0. Keep administrative accounts, workstations, and credentials separated
across tiers and estates.

## Secure score and posture

Track the cloud secure score and the on-premises hardening compliance, review
them on the routine cadence, and act on the highest-impact recommendations.

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Investigate a risky sign-in | Triage and respond to identity risk | Manual | _Security team_ |
| Respond to an endpoint detection | Contain and remediate a device alert | Manual | _Security team_ |
| Review privileged access | Attest privileged roles across estates | Semi-automated | _Identity team_ |
| Run an access recertification | Recertify access on the stated cadence | Manual | _Security team_ |

### Runbook: investigate a risky sign-in

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Purpose**: triage an identity-risk detection and take the right protective
  action.
- **Procedure**: review the sign-in and risk detail in Entra, confirm whether the
  sign-in was legitimate, and apply the response (confirm safe, require password
  reset, or block) per policy.
- **Escalation**: for a confirmed compromise, invoke the
  [incident response](18-incident-response-and-escalation.md) protocol.

## Audit and compliance

- Privileged access is reviewed monthly across on-premises and Entra.
- Audit logs from both estates are collected centrally and retained per policy.
- Compliance obligations are tracked and evidenced through Microsoft Purview.

## See also

- [Conditional Access and Zero Trust](08-conditional-access-and-zero-trust.md)
- [Microsoft Entra tenant](06-entra-id-tenant.md)
- [Incident response and escalation](18-incident-response-and-escalation.md)
