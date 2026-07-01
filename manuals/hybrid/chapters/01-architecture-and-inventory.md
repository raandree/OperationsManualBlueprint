# Architecture and inventory

This chapter is the reference description of the hybrid estate: the on-premises
topology, the Microsoft Entra tenant and cloud workloads, and the connectivity
that joins them. It mirrors the structure of the environment so operators can
locate any component quickly.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Infrastructure architect_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

Reference material describing what exists on-premises, what exists in the cloud,
and how the two connect. Procedures live in the service chapters and runbooks.

## Hybrid topology overview

_Summarize the estate: the on-premises sites and domains, the Entra tenant and
its subscriptions, the identity synchronization path, and the network
connectivity between on-premises and Azure. Attach or link a current diagram._

```text
_Replace with a diagram of on-premises sites, the sync server, the Entra_
_tenant, Azure subscriptions, and the connectivity (VPN / ExpressRoute)._
```

## On-premises inventory

| Hostname | Role | Site | OS version | IP address | Owner |
|----------|------|------|------------|------------|-------|
| _DC-HQ-01_ | _Domain controller_ | _HQ_ | _Windows Server 20xx_ | _10.x.x.x_ | _Directory team_ |
| _AADC-01_ | _Entra Connect sync server_ | _HQ_ | _Windows Server 20xx_ | _10.x.x.x_ | _Identity team_ |

## Cloud tenant reference

| Property | Value |
|----------|-------|
| Entra tenant name | _example.onmicrosoft.com_ |
| Tenant ID | _GUID_ |
| Verified domains | _example.com_ |
| Azure subscriptions | _list with IDs_ |
| Microsoft 365 plan | _plan / licensing_ |

## Cloud workload inventory

| Workload | Platform | Subscription / service | Owner |
|----------|----------|------------------------|-------|
| _Line-of-business app_ | _Azure IaaS_ | _Subscription_ | _App team_ |
| _Exchange Online_ | _Microsoft 365_ | _Tenant_ | _Messaging team_ |

## Hybrid connectivity

| Link | Type | Endpoints | Bandwidth | Owner |
|------|------|-----------|-----------|-------|
| _Site-to-site_ | _VPN / ExpressRoute_ | _HQ ↔ Azure region_ | _—_ | _Network team_ |

## Service dependencies

Record dependencies that cross the on-premises and cloud boundary, because they
determine blast radius during an incident.

| Service | Depends on | Depended on by |
|---------|------------|----------------|
| _Hybrid identity_ | _Active Directory, sync server, Entra_ | _All cloud sign-in_ |
| _Conditional Access_ | _Entra, device compliance_ | _Cloud app access_ |

## See also

- [Roles and responsibilities](02-roles-and-responsibilities.md)
- [Hybrid identity](07-hybrid-identity.md)
- [Cloud workloads](11-cloud-workloads.md)
