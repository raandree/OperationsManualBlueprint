# Architecture and inventory

This chapter is the reference description of the on-premises estate: its physical
and logical topology, its sites, and the authoritative inventory of assets. It
mirrors the structure of the environment so operators can consult it to find any
component quickly.

| Owner | Last reviewed | Review cadence | Classification |
|-------|---------------|----------------|----------------|
| _Infrastructure architect_ | _YYYY-MM-DD_ | _Quarterly_ | _Internal_ |

## Scope

This is reference material. It describes what exists and how the pieces relate.
It does not contain procedures; those live in the service chapters and runbooks.

## Topology overview

_Summarize the estate in two or three sentences: the number of sites, the forest
and domain design, the core services per site, and the connectivity between
sites. Attach or link a current network diagram._

```text
_Replace with a diagram or an ASCII sketch of sites, domain controllers,_
_member servers, and inter-site links._
```

## Sites and connectivity

| Site | Location | Role | WAN link | Notes |
|------|----------|------|----------|-------|
| _HQ_ | _City_ | _Primary datacentre_ | _Bandwidth / provider_ | _—_ |
| _DR_ | _City_ | _Recovery site_ | _Bandwidth / provider_ | _—_ |

## Naming conventions

State the naming standards so operators can infer an asset's role from its name.

| Object type | Convention | Example |
|-------------|------------|---------|
| Domain controller | _`DC-<site>-<nn>`_ | _`DC-HQ-01`_ |
| Member server | _`<role>-<site>-<nn>`_ | _`SQL-HQ-01`_ |
| Client device | _`<type>-<serial>`_ | _`LT-1A2B3C`_ |

## Server inventory

The authoritative list of servers. Keep this current; the disaster recovery and
patching chapters depend on it.

| Hostname | Role | Site | OS version | IP address | Owner |
|----------|------|------|------------|------------|-------|
| _DC-HQ-01_ | _Domain controller_ | _HQ_ | _Windows Server 20xx_ | _10.x.x.x_ | _Directory team_ |

## Service dependencies

Record the dependencies between services so responders understand blast radius
during an incident.

| Service | Depends on | Depended on by |
|---------|------------|----------------|
| _Exchange Server_ | _Active Directory, DNS, PKI_ | _Mail flow, clients_ |

## Core network services

| Service | Provider host(s) | Notes |
|---------|------------------|-------|
| _DNS_ | _Domain controllers_ | _AD-integrated zones_ |
| _DHCP_ | _—_ | _Scope and failover_ |
| _Time (NTP)_ | _PDC emulator_ | _Authoritative source_ |

## See also

- [Roles and responsibilities](02-roles-and-responsibilities.md)
- [Backup and disaster recovery](11-backup-and-disaster-recovery.md)
