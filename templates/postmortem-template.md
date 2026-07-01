# Postmortem: _short incident title_

A postmortem is a blameless, systematic analysis written after a significant
incident. It focuses on events and systemic causes, never on individuals. Copy
this template for each postmortem and complete it while the details are fresh.

| Incident ID | Severity | Date of incident | Author | Status |
|-------------|----------|------------------|--------|--------|
| _INC-0000_ | _Sev 1–4_ | _YYYY-MM-DD_ | _Role / team_ | _Draft / reviewed / closed_ |

## Summary

_Two or three sentences: what happened, the user-visible impact, and how it was
resolved. A reader should understand the incident from this paragraph alone._

## Impact

- **Duration**: _time from detection to resolution._
- **Scope**: _services, sites, and user population affected._
- **Business impact**: _outage, degradation, data loss, or breached objective._
- **Objectives affected**: _recovery time objective (RTO) or recovery point
  objective (RPO) breached, if any._

## Timeline

_All times in a single stated time zone (prefer UTC). One row per notable event._

| Time | Event |
|------|-------|
| _hh:mm_ | _What happened or what an operator did._ |

## Root cause

_The underlying cause of the incident, established with evidence. Distinguish the
trigger from the deeper condition that allowed the incident to occur._

## Contributing factors

- _Conditions that made the incident more likely, harder to detect, or slower to
  resolve. These are systemic, not personal._

## What went well

- _Detection, response, or tooling that worked and should be preserved._

## What went wrong

- _Gaps in detection, runbooks, automation, or escalation that slowed recovery._

## Action items

_Each item is specific, owned, and dated. Feed fixes back into runbooks and
automation so the same incident cannot recur silently._

| Action | Type | Owner | Due date | Tracking link |
|--------|------|-------|----------|---------------|
| _What will change._ | _Prevent / detect / mitigate / process_ | _Role_ | _YYYY-MM-DD_ | _Ticket_ |

## Lessons learned

_The durable, transferable takeaways for the wider team._

## See also

- [Runbook template](runbook-template.md)
