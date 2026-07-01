# Public key infrastructure

The public key infrastructure (PKI) issues and manages the certificates that
secure authentication, encryption, and signing across the estate. It is built on
Active Directory Certificate Services (AD CS). Certificate expiry is a common,
avoidable cause of outages, so this chapter emphasizes lifecycle tracking.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Security lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Certificate authority (CA) operations: the CA hierarchy, certificate templates,
issuance and revocation, the certificate revocation list (CRL), and the backup
and recovery of CA keys.

## CA hierarchy

_Describe the hierarchy: the offline root CA, any policy CAs, and the issuing
CAs. State where the root CA is stored and how it is kept offline._

| CA | Type | Host | Validity | Key protection |
|----|------|------|----------|----------------|
| _Root CA_ | _Offline root_ | _Air-gapped_ | _20 years_ | _HSM / offline_ |
| _Issuing CA_ | _Enterprise issuing_ | _CA-HQ-01_ | _10 years_ | _HSM / TPM_ |

## Certificate templates

| Template | Purpose | Autoenrollment | Validity | Owner |
|----------|---------|----------------|----------|-------|
| _Computer_ | _Device authentication_ | _Yes_ | _1 year_ | _Security team_ |
| _WebServer_ | _TLS for internal services_ | _No_ | _1 year_ | _Security team_ |

## Critical certificate register

Track every high-impact certificate and its expiry. Expiry of any of these can
cause an outage; the monitoring chapter should alert well before each date.

| Certificate | System | Expiry date | Renewal owner | Renewal runbook |
|-------------|--------|-------------|---------------|-----------------|
| _Issuing CA certificate_ | _CA-HQ-01_ | _YYYY-MM-DD_ | _Security team_ | _Renew CA certificate_ |
| _Exchange TLS_ | _Exchange_ | _YYYY-MM-DD_ | _Messaging team_ | _Renew service certificate_ |

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Issue a service certificate | Request and install a certificate for a service | Manual | _Security team_ |
| Renew a service certificate | Replace a certificate before expiry | Semi-automated | _Security team_ |
| Revoke a certificate | Revoke and publish an updated CRL | Manual | _Security team_ |
| Publish the CRL | Ensure the CRL is current and reachable | Semi-automated | _Security team_ |

### Runbook: renew a service certificate

Follow the shared [runbook template](../../../templates/runbook-template.md).

- **Purpose**: replace a certificate before it expires with no service
  interruption.
- **When to use**: on the alert raised ahead of the expiry date in the critical
  certificate register.
- **Verification**: confirm the new certificate's thumbprint is bound to the
  service and that clients trust the full chain.
- **Rollback**: rebind the previous certificate if the new one fails validation;
  it remains valid until its own expiry.

## CRL and revocation health

Document the CRL publication points, the CRL and delta-CRL validity periods, and
how availability of the CRL distribution points is monitored. A stale or
unreachable CRL can break authentication estate-wide.

## See also

- [Exchange Server](06-exchange-server.md)
- [Monitoring and alerting](08-monitoring-and-alerting.md)
- [Security and access management](10-security-and-access-management.md)
