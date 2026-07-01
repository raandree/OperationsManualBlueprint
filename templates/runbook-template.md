# Runbook: _exact task this runbook performs_

A runbook is a how-to guide for one commonly repeated operational task. Copy this
template for each new runbook, give it a precise title that names the task (for
example, "Runbook: fail over the SQL availability group"), and keep the sections
below. Delete this paragraph in the finished runbook.

| Owner | Last reviewed | Review cadence | Automation level | Classification |
|-------|---------------|----------------|------------------|----------------|
| _Role / team_ | _YYYY-MM-DD_ | _Quarterly_ | _Manual / semi-automated / automated_ | _Internal_ |

## Purpose

_One or two sentences stating the goal this runbook achieves and the result the
operator should expect._

## When to use

_The trigger: the alert, request, schedule, or condition that makes this runbook
the right response. Link to the alert in the monitoring and alerting chapter
where applicable._

## Prerequisites

- _Required access, roles, or privileged group membership._
- _Tools, consoles, or jump hosts needed._
- _Maintenance window or change record, if required._
- _Preconditions to verify before starting (service state, backups current)._

## Safety notes

- _Blast radius and who is affected if the task goes wrong._
- _Steps that are irreversible — call them out explicitly._
- _Whether a change record or approval is mandatory before proceeding._

## Procedure

_A logical, time-ordered sequence of actions. Number every step. Include the
judgement the operator must apply, and show the exact command where one exists._

1. _First action._
2. _Second action._

   ```powershell
   # Example command — replace with the real one
   Get-Service -Name '_ServiceName_'
   ```

3. _Continue until the task is complete._

## Verification

- _How to confirm the task succeeded (expected output, health check, dashboard)._
- _The specific values or states that prove success._

## Rollback

_The ordered steps to return to the last-known-good state if verification fails,
or an explicit statement that the task cannot be rolled back and what to do
instead._

## Escalation

_When to stop and escalate, and the escalation path to follow (see the incident
response and escalation chapter). Name the next contact and the response-time
expectation._

## References

- _Linked reference material, vendor documentation, or related runbooks._

## See also

- [Incident response and escalation](../manuals/on-premises/chapters/14-incident-response-and-escalation.md)
- [Postmortem template](postmortem-template.md)
