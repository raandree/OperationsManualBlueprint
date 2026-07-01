# Operations manual best practices and templates

**Purpose**: Research reference for the Windows Operations Manual Blueprint.
**Audience**: Engineers and technical writers building the blueprint scaffolding.
**Status**: Draft (research phase).
**Last updated**: 2026-07-01.

This document collects best practices, frameworks, and reusable templates for
authoring an operations manual, with an emphasis on Windows Server
infrastructure. It is the evidence base that informs the blueprint's structure.
Every non-obvious claim is cited to a primary or authoritative source in the
[References](#references) section.

## What an operations manual is

An operations manual is the single, version-controlled source of truth that
describes how a team runs a system or service in production: who is responsible,
what routine and emergency procedures exist, how the system is monitored, how
incidents are handled, and how the service recovers from failure. Mature
organizations rely on version-controlled standard operating procedures (SOPs),
wikis, and operational manuals to enforce standards [5].

An operations manual is broader than any single runbook. It is the container
that organizes many procedures, references, and policies into one coherent,
navigable whole.

## Terminology and how the pieces relate

Precise terminology matters because these words are frequently confused. The
distinctions below are used consistently throughout the blueprint.

| Term | What it is | Source |
|------|------------|--------|
| Operations manual | The overarching, version-controlled documentation set describing how a service is run. Contains runbooks, SOPs, policies, and reference material. | [5] |
| Runbook | A detailed "how-to" for one commonly repeated task or procedure (for example, patch a server, renew a TLS certificate, take a database backup). | [6] |
| Playbook | The big-picture response to a larger issue or event. A playbook can orchestrate multiple runbooks and multiple people. | [6] |
| Standard operating procedure (SOP) | A formalized, repeatable procedure that captures how work is done; runbooks are a common form of SOP. | [5] |
| Checklist | A routine task broken into simple, discrete, repeatable, actionable steps. | [5] |

PagerDuty frames the relationship with a cooking analogy: a runbook is a recipe
(instructions for one dish), whereas a playbook is the guidebook for hosting the
whole event, of which the recipe is one part [6].

Runbooks exist on an automation spectrum [6]:

1. **Manual** — step-by-step instructions followed by an operator.
2. **Semi-automated** — operator-followed steps combined with automated steps.
3. **Fully automated** — every step is automated and needs no operator.

## Documentation framework: Diátaxis

Diátaxis is a widely adopted, systematic approach to technical documentation. It
identifies four distinct user needs and four corresponding forms of
documentation, and proposes that documentation be organized around those needs
[1]:

| Mode | Orientation | User need | Example in an ops manual |
|------|-------------|-----------|--------------------------|
| Tutorial | Learning-oriented | "Teach me" | Onboarding a new on-call engineer |
| How-to guide | Task-oriented | "Help me do X" | A runbook to fail over a cluster |
| Reference | Information-oriented | "Tell me the facts" | Server inventory, ports, SLAs |
| Explanation | Understanding-oriented | "Help me understand" | Why the architecture is designed this way |

Two of these modes carry most of an operations manual's weight.

### How-to guides (the runbook mode)

How-to guides are directions that guide a reader through a task toward a result;
they are goal-oriented [3]. Key principles that apply directly to runbook
authoring [3]:

- **Address real-world complexity.** A guide must be adaptable to real use
  cases, not just one narrow path.
- **Omit the unnecessary.** Practical usability beats completeness; start and
  end in a reasonable place and link out for the rest.
- **Provide a set of instructions** as a logical, time-ordered sequence of
  actions, including the judgement the operator must apply.
- **Seek flow.** Ground the sequence in how the operator actually works so the
  guide anticipates their next step.
- **Name precisely.** Titles should say exactly what the guide shows (for
  example, "How to fail over the SQL availability group"), not just name a
  topic.

Diátaxis compares a how-to guide to a recipe: even an expert follows it to be
sure the task is done correctly, and it deliberately excludes teaching and
discussion [3].

### Reference (the facts mode)

Reference material describes the machinery; it is austere, neutral, and
authoritative. One does not read reference material, one consults it [2]. Key
principles [2]:

- **Describe and only describe.** Keep it factual and neutral; link out to
  how-to guides and explanation instead of embedding them.
- **Adopt standard patterns.** Consistency is what makes reference usable; put
  each fact where the reader expects it, in a familiar format.
- **Respect the structure of the machinery.** The structure of the reference
  should mirror the structure of the system it documents.
- **Provide examples** to illustrate without drifting into instruction.

## Anatomy of an operations manual

Synthesizing the sources, an operations manual for a production service
typically contains the following sections. The seven-part service documentation
model is attributed to Tom Limoncelli (ex-Google system administrator) and is
reproduced here from PagerDuty, which cites him [6]:

1. Service overview
2. Service build information
3. Instructions for deploying the software
4. Instructions for common tasks
5. "Pager playbook" — every possible monitoring alert with step-by-step
   instructions for when it fires
6. Disaster recovery plans
7. Service level agreement (SLA)

Expanded into a fuller operations-manual outline that also reflects Google SRE
and Microsoft guidance, the recommended sections are:

| Section | Diátaxis mode | Purpose | Key sources |
|---------|---------------|---------|-------------|
| Service overview and architecture | Explanation / Reference | What the service is, its components and dependencies | [6] |
| Roles, responsibilities, and contacts | Reference | Who owns what; escalation contacts | [7] |
| Build and deployment | How-to | How the service is built and deployed | [6] |
| Routine operational procedures (runbooks) | How-to | Repeatable day-to-day tasks as checklists | [5][6] |
| Monitoring and alerting (pager playbook) | Reference / How-to | Each alert mapped to a response | [6][7] |
| Incident response and escalation | How-to | Clear escalation paths and incident procedure | [7] |
| Disaster recovery and backup | How-to | Recovery plans, RTO/RPO, restore steps | [6] |
| Maintenance and patching | How-to | Routine updates and change windows | [5] |
| Security and access management | Reference / How-to | Access model, secrets, compliance steps | [5] |
| Service level agreement (SLA) | Reference | Availability targets and obligations | [6] |
| Change management | How-to | How changes are proposed, approved, deployed | [5] |

## Operational standardization principles

Microsoft's Azure Well-Architected Framework treats standardization as
recommendation OE:02: "Use standardization as a way to make routine, ad-hoc, and
emergency operations consistent and predictable" [5]. The most transferable
guidance:

- **Define actionable checklists for routine tasks.** Break each routine task
  into simple, discrete, repeatable items. Microsoft's worked example for
  applying a dependency update lists: test in lower environments, submit a
  change request, deploy, and update documentation to reflect the new version
  [5].
- **Have reusable checklists for emergencies too.** Emergency scenarios differ,
  but roles, responsibilities, and communication paths must always be clear;
  teams should follow general standards even for novel tasks, and may pre-mark
  which low-risk, time-consuming steps can be skipped with authorized approval
  [5].
- **Treat documentation as a living asset.** Documentation should capture SOPs
  and define how work is done through actionable checklists that reference the
  relevant tools. Store runbooks in a version-controlled repository, require
  scheduled reviews as part of the operational cadence, and include authorship
  and review dates, highlighting changes between revisions [5].
- **Automate intentionally where practical** to reduce variability and
  human error in repetitive, error-prone tasks [5].
- **Adopt industry-proven practices** rather than inventing processes from
  scratch, and reuse centralized organizational standards where they exist [5].

## Incident response, on-call, and escalation

Google's Site Reliability Engineering (SRE) book, chapter 11, "Being On-Call,"
describes the resources that make on-call sustainable and safe. The most
important on-call resources are [7]:

- Clear escalation paths.
- Well-defined incident-management procedures.
- A blameless postmortem culture.

Additional practices from the same chapter that a Windows operations manual
should encode [7]:

- **Defined response-time expectations** tied to service criticality (for
  example, minutes for user-facing systems, tens of minutes for less
  time-sensitive systems).
- **A formal incident-management protocol** for complex, multi-team, or
  open-ended incidents, so responders triage and resolve rationally rather than
  by intuition under stress.
- **Blameless postmortems** after significant incidents, focusing on events and
  systemic causes rather than individuals, and feeding fixes back into
  automation and documentation.

## Applying the practices to Windows environments

The frameworks above are platform-neutral. For a Windows Server operations
manual, the "tools at hand" that runbooks reference are typically the Windows
operations toolchain. The following mapping applies the cited principles to a
Windows context (practitioner guidance, grounded in the general sources rather
than a single citation):

- **Scripted runbooks** are naturally expressed in PowerShell, which supports
  the manual-to-fully-automated spectrum described by PagerDuty [6]. Store
  scripts alongside the runbook text in the same version-controlled repository
  [5].
- **Desired State Configuration (DSC)** and configuration-management tooling
  (for example, MECM/SCCM) support the "automate intentionally" and
  infrastructure-as-code standards that OE:02 recommends [5].
- **Monitoring and alerting** sections map alerts from Windows sources (Event
  Log, performance counters, and the monitoring platform in use) to responses,
  realizing the "pager playbook" section [6].
- **Disaster recovery** procedures document backup and restore for Windows
  workloads with explicit recovery-time and recovery-point objectives (RTO and
  RPO), satisfying the disaster-recovery section of the service model [6].
- **Rehearsals** (analogous to SRE disaster-recovery drills) validate that the
  documented procedures actually work before an incident [7].

These Windows specifics should be captured as reference tables and how-to
runbooks, keeping the two Diátaxis modes distinct [2][3].

## Existing templates and starting points

The following are concrete, reusable scaffolds the blueprint can build on:

| Template or model | What it gives you | Source |
|-------------------|-------------------|--------|
| Diátaxis four-mode structure | A top-level information architecture (tutorial / how-to / reference / explanation) | [1] |
| Limoncelli seven-section service model | A ready section list for a single service's runbook set | [6] |
| Azure WAF Operational Excellence checklist (OE:02) | Standardization and documentation-quality criteria | [4][5] |
| PagerDuty runbook creation process | A three-step method to plan, write, and improve a runbook | [6] |
| Google SRE on-call chapter | Incident, escalation, and postmortem practices | [7] |

### PagerDuty's runbook creation process

PagerDuty recommends a repeatable three-step process for each runbook [6]:

1. **Plan** the runbook by identifying the most common recurring tasks or
   incidents (mine ticketing systems, incident reports, and postmortems) and the
   best known solution for each.
2. **Write** it clearly and simply, with consistent naming and headers across
   all runbooks, specific to your processes, then field-test the documented
   procedure.
3. **Test, update, and improve** continuously so the runbook stays accurate as
   systems change; the best runbooks evolve with the product and process.

## Recommended blueprint scaffolding

Combining the sources, the Windows Operations Manual Blueprint should provide a
directory-and-template scaffold shaped like this (a proposal to be refined in
the next phase):

```text
operations-manual/
  README.md                     # Manual overview + navigation (Explanation)
  00-overview/
    service-overview.md         # Architecture, components, dependencies
    roles-and-contacts.md       # Ownership, on-call, escalation contacts
    sla.md                      # Service level agreement
  10-reference/
    inventory.md                # Servers, roles, ports (Reference)
    monitoring-and-alerts.md    # Alert-to-response catalogue
    access-and-security.md      # Access model, secrets, compliance
  20-runbooks/
    _template-runbook.md        # Standard runbook template (How-to)
    deploy-service.md
    patching.md
    backup-and-restore.md
  30-incident/
    incident-response.md        # Escalation paths + incident protocol
    postmortem-template.md      # Blameless postmortem template
  40-disaster-recovery/
    dr-plan.md                  # RTO/RPO, recovery procedures
  CHANGELOG.md                  # Living-document change history
```

Each runbook file should follow a consistent template with, at minimum: title
stating the exact task, purpose, prerequisites, an ordered list of actionable
steps, verification, rollback, and metadata (owner, last review date) — applying
the how-to principles [3] and the living-document requirements [5].

## Quality checklist for the blueprint

Derived from the sources, a finished operations manual should satisfy:

- [ ] Organized by Diátaxis mode so readers can find the right kind of content
      [1].
- [ ] Runbooks written as goal-oriented how-to guides with precise titles [3].
- [ ] Reference material kept neutral, factual, and mirroring the system
      structure [2].
- [ ] Routine tasks expressed as actionable, discrete checklists [5].
- [ ] Stored under version control with authorship and review dates, and a
      scheduled review cadence [5].
- [ ] Clear escalation paths and a defined incident-management procedure [7].
- [ ] A blameless postmortem process feeding fixes back into the manual [7].
- [ ] Disaster-recovery plans with explicit RTO/RPO [6].
- [ ] Consistent naming and headers across all runbooks [6].

## References

1. **Diátaxis** — "Diátaxis: A systematic approach to technical documentation
   authoring." <https://diataxis.fr/> (accessed 2026-07-01).
2. **Diátaxis** — "Reference." <https://diataxis.fr/reference/> (accessed
   2026-07-01).
3. **Diátaxis** — "How-to guides." <https://diataxis.fr/how-to-guides/>
   (accessed 2026-07-01).
4. **Microsoft** — "Operational excellence quick links," Azure Well-Architected
   Framework.
   <https://learn.microsoft.com/en-us/azure/well-architected/operational-excellence/>
   (updated 2025-07-14; accessed 2026-07-01).
5. **Microsoft** — "Architecture strategies for standardizing operations"
   (recommendation OE:02), Azure Well-Architected Framework.
   <https://learn.microsoft.com/en-us/azure/well-architected/operational-excellence/formalize-operations-tasks>
   (updated 2026-02-11; accessed 2026-07-01).
6. **PagerDuty** — "What is a Runbook?"
   <https://www.pagerduty.com/resources/learn/what-is-a-runbook/> (accessed
   2026-07-01). Includes the seven-section service documentation model
   attributed to Tom Limoncelli (primary source
   <https://opsreportcard.com/section/11> was unavailable at access time).
7. **Google** — Betsy Beyer et al., "Being On-Call," chapter 11, *Site
   Reliability Engineering*, O'Reilly, 2017.
   <https://sre.google/sre-book/being-on-call/> (accessed 2026-07-01). Licensed
   under CC BY-NC-ND 4.0.

## See also

- [Memory Bank project brief](../.memory-bank/projectbrief.md)
- [Glossary](../.memory-bank/glossary.md)
- [System patterns](../.memory-bank/systemPatterns.md)
