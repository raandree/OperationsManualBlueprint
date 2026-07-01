# Public key infrastructure

The public key infrastructure (PKI), built on Active Directory Certificate
Services (AD CS), issues the certificates that secure authentication and
encryption across the hybrid estate. In a hybrid model, certificates also reach
cloud-managed devices through Intune, so this chapter covers both delivery paths.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Security lead_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Certificate authority (CA) operations, certificate templates, issuance and
revocation, the certificate revocation list (CRL), and certificate delivery to
both domain-joined devices (autoenrollment) and cloud-managed devices (Intune
SCEP or PKCS).

## CA hierarchy

| CA | Type | Host | Validity | Key protection |
|----|------|------|----------|----------------|
| _Root CA_ | _Offline root_ | _Air-gapped_ | _20 years_ | _HSM / offline_ |
| _Issuing CA_ | _Enterprise issuing_ | _CA-HQ-01_ | _10 years_ | _HSM / TPM_ |

## Certificate delivery paths

| Path | Devices | Mechanism | Owner |
|------|---------|-----------|-------|
| _Autoenrollment_ | _Domain-joined_ | _Group Policy_ | _Security team_ |
| _Intune SCEP / PKCS_ | _Cloud-managed_ | _Intune + connector_ | _Endpoint team_ |

## Critical certificate register

Track every high-impact certificate and its expiry, including those used by
hybrid services such as the synchronization endpoints and Exchange hybrid.

| Certificate | System | Expiry date | Renewal owner | Renewal runbook |
|-------------|--------|-------------|---------------|-----------------|
| _Issuing CA certificate_ | _CA-HQ-01_ | _YYYY-MM-DD_ | _Security team_ | _Renew CA certificate_ |
| _Exchange hybrid certificate_ | _Exchange / hybrid_ | _YYYY-MM-DD_ | _Messaging team_ | _Renew service certificate_ |

## Runbooks

| Runbook | Purpose | Automation level | Owner |
|---------|---------|------------------|-------|
| Issue a service certificate | Request and install a certificate | Manual | _Security team_ |
| Renew a service certificate | Replace a certificate before expiry | Semi-automated | _Security team_ |
| Revoke a certificate | Revoke and publish an updated CRL | Manual | _Security team_ |
| Deliver a device certificate via Intune | Configure SCEP/PKCS delivery | Manual | _Endpoint team_ |

## CRL and revocation health

Document the CRL publication points and validity periods, and confirm the CRL
distribution points are reachable from both on-premises and cloud-managed
devices. A stale or unreachable CRL breaks authentication broadly.

## See also

- [Endpoint management and co-management](10-endpoint-management-intune-comanagement.md)
- [Exchange hybrid and Exchange Online](09-exchange-hybrid-and-online.md)
- [Security and compliance](14-security-and-compliance.md)
