## Super Validator Node Incident Escalation and Offboarding Process

### Status

Draft for Super Validator operator review.

This process reflects current operational consensus discussed in the Super Validator operations call and should be reviewed, edited, and approved by the Super Validator operators before being treated as final.

## Purpose

This process defines how Super Validator operators coordinate incident escalation and, when necessary, initiate an offboarding vote for a Super Validator node that is unavailable, unresponsive, misconfigured, or otherwise creating material operational risk to the Global Synchronizer or Canton Network.
The purpose of this process is to protect network stability, availability, security, and operational resilience while maintaining a clear and auditable record of incident response and governance actions.

## Scope

This process applies to operational incidents involving a Super Validator node where offboarding may be required.
- This process covers:
   - Escalation of Super Validator node incidents
   - Expected response timelines
   - When an offboarding vote may be proposed
   - Expectations for Super Validator operators during the voting window
   - Documentation and post-incident follow-up
   - Periodic testing of the escalation process

- This process does not replace:
   - Normal Super Validator onboarding or re-onboarding processes
   - Emergency IP whitelist removal processes
   - The CIP-0111 process for reducing Super Validator reward weight
   - Featured App, Validator, compliance, or Tokenomics review processes
   - Regular software release or bugfix release processes

If the issue is caused by a validator, application, whitelisted IP, infrastructure provider, or other non-Super-Validator participant, the Emergency IP Whitelist Removal Process may be the more appropriate process.

## Confidential Escalation Contacts

Escalation email addresses and contact details that trigger 24/7 operational response must not be published in a public repository.

The current escalation contact list should be maintained in a private repository or password protected file controlled by the Super Validator operators and/or Canton Foundation Operations.

- The private contact repository should make it easy to:
   - Confirm who has access
   - Audit changes
   - Keep current escalation contacts updated
   - Remove contacts for people no longer involved in operations
   - Test whether escalation emails are still functioning

Public process documents may link to the private contact repository, but must not expose private escalation addresses directly.

## Guiding Principles
### 1. Network stability comes first
The purpose of offboarding is to protect the Global Synchronizer and Canton Network when a Super Validator node is causing, or is reasonably believed to be causing, material operational risk.
### 2. Escalation should normally precede offboarding
An offboarding vote should normally be proposed only after the affected operator has been escalated to and has not responded or has not remediated the issue in time.
### 3. The process requires judgment
“Node down” is not always a binary condition. Status reports, sequencer health, mediator health, Scan behavior, ingress configuration, topology progress, database behavior, Canton BFT configuration, and other operational signals may all be relevant.
Operators must use reasonable judgment based on the actual impact to the network.
### 4. The four-hour timeline should be real
The incident response and offboarding process should not be extended merely to be “nice.” If a four-hour window is required, operators should treat that as an actual operational commitment.
### 5. Operators must be able to vote in time
Each Super Validator operator should either be empowered by its Super Validator rights owner to vote on operational offboarding matters, or must ensure that the relevant rights owner is available on short notice.
If rights-owner approval is required, that approval path must work within the four-hour window.
### 6. Slack is not enough
Slack discussion is useful during incidents, but the durable record should be preserved through email, GitHub, onchain vote descriptions, or another persistent record.
### 7. Effective-at-threshold should be rare
Effective-at-threshold should be reserved for emergency situations where immediate action is required. It should not be the default setting for offboarding votes if a four-hour effectivity window is sufficient.

## Qualifying Events

An offboarding vote may be considered when there is a reasonable belief that continued participation by a Super Validator node presents a material risk to the network.

Examples include:
- The Super Validator node is down or unable to perform required network functions.
- The node is not submitting required operational signals or status reports, and other evidence suggests the node is impaired.
- The node is misconfigured in a way that materially affects synchronizer operation.
- The node’s ingress, reverse proxy, sequencer, mediator, Scan, topology processing, database, or Canton BFT configuration is causing network disruption.
- The node is causing instability that the network cannot tolerate for another operational response cycle.
- The affected operator does not respond to escalation within the expected timeline.
- The affected operator acknowledges the issue but cannot remediate quickly enough to protect the network.
- Any other operational incident where a Super Validator node materially threatens availability, stability, security, or integrity of the network.

A node should not be offboarded merely because it had a transient issue, if the affected operator is responsive, remediation is underway, and the network can reasonably tolerate the node remaining onboarded while the fix is completed.

## Incident Escalation Procedure

### Step 1 - Identify and Document the Issue
The operator identifying the issue should collect and document available evidence, such as:
 - Affected Super Validator node
- Start time or approximate discovery time
- Observable symptoms
- Network impact
- Relevant metrics, logs, dashboards, screenshots, or command output
- Whether the affected operator has already been contacted
- Whether the issue appears to be resolved, ongoing, or worsening

The issue should be raised in the appropriate Super Validator operations Slack channel.

Where possible, evidence should also be preserved in a durable record, such as an email thread, GitHub issue, GitHub pull request, or other persistent location.

### Step 2 - Send Formal Escalation

A formal incident escalation should be sent to the affected operator’s escalation contact.

**Subject:**
Super Validator Node Incident Escalation — [Affected SV Node] — [Action Needed]

**Body:**
You may receive multiple instances of this escalation from various Super Validator operators.
Please escalate this incident to your Super Validator operations team.

**Affected Super Validator node:**
 [SV node name]
 
**Issue summary:**
 [Brief description of the incident]
 
**Observed network impact:**
 [Description of impact]
 
**Requested action:**
 [What the affected operator needs to do]
 
**Evidence:**
 [Links or summary of relevant evidence]
 
**Response deadline:**
 The time window for this response is four hours from the time this message was sent.
 
**Response method:**
 Please acknowledge this message by replying to the sender and/or responding in the appropriate Super Validator operations Slack channel.
 
**Slack reference:**
 [Link to the most recent relevant Slack thread, if available]
 
### Step 3 - Start the Four-Hour Incident Clock
The four-hour incident response clock starts when the formal escalation message is sent.

If an offboarding vote is created without a prior formal escalation because of an urgent emergency, the four-hour clock starts when the offboarding vote announcement is sent.

During this period, the affected operator should acknowledge the escalation and provide one of the following:
- Confirmation that the issue is resolved
- Confirmation that remediation is underway
- Estimated time to resolution
- Explanation of why the issue is not caused by the affected node
- Any other information needed by the Super Validator operators to assess risk

### Step 4 - Decide Whether to Propose Offboarding
An offboarding vote should normally be considered if:

- The affected operator does not respond within a reasonable period after escalation;
- The affected operator responds but cannot remediate in time;
- The issue continues to materially threaten the network; or
- The network cannot tolerate the node remaining onboarded until the issue is resolved.

As a practical guideline, if there is no meaningful response within approximately one hour of escalation, any Super Validator operator may begin preparing an offboarding vote.

This one-hour guideline does not replace the four-hour voting expectation. It is intended to avoid waiting until the end of the four-hour window before preparing necessary governance action.

If the network is in active danger and cannot tolerate waiting, an operator may propose an offboarding vote sooner.

## Offboarding Vote Procedure

### Step 1 - Prepare the Vote

The proposing operator should prepare an onchain vote proposal that includes:
- Affected Super Validator node
- Reason for proposed offboarding
- Summary of escalation attempts
- Summary of available evidence
- Expected effectivity time
- Link to a durable record containing supporting context
- Any known remediation or response from the affected operator

The vote description should be clear enough that operators can understand the issue without relying only on Slack history.

If the vote UI requires a URL, the URL should point to a durable record such as an email archive, GitHub issue, GitHub pull request, or other persistent incident record. Slack links may be included, but should not be the only durable record.

### Step 2 - Announce the Vote

The proposing operator should announce the vote through the appropriate Super Validator operations email channel and Slack channel.
The announcement should include:
- Link to the vote proposal or vote contract ID
- Affected Super Validator node
- Reason for the vote
- Four-hour deadline
- Requested operator action
- Link to supporting evidence
- Whether the proposal uses normal effectivity or effective-at-threshold
  
### Step 3 - Voting Expectations

All Super Validator operators are expected to vote within the four-hour incident window.

Operators should vote either accept or reject. Silence should not be treated as a normal or acceptable outcome for an operational offboarding vote.

Each operator should make its own judgment based on:
- Whether the issue presents material risk to the network
- Whether the affected operator is responsive
- Whether remediation is complete or likely to complete in time
- Whether the network can tolerate the node remaining onboarded
- Whether offboarding creates greater risk than leaving the node onboarded

Operators that require rights-owner approval must ensure that approval can be obtained within the four-hour window. Alternatively, operators should obtain standing authority to vote on operational offboarding matters.

### Step 4 - Effectivity

The default approach should be a four-hour effectivity window rather than immediate effective-at-threshold.

Effective-at-threshold should be used only in emergency situations where immediate offboarding is required to protect the network.

Examples where effective-at-threshold may be appropriate:
- The node is actively causing severe network instability.
- At least two-thirds of Super Validator operators agree in the moment that immediate offboarding is required.
- Waiting for the four-hour window would materially increase risk to the network.

Examples where effective-at-threshold should not be used:
- Routine operational cleanup
- Normal weight changes
- Featured App status implementation
- Customer or participant pressure to move quickly
- Cases where the four-hour window is sufficient

### Step 5 - If the Vote Passes
If the offboarding vote passes, Super Validator operators should complete any required local, configuration, or operational steps as quickly as practical.
Operators should confirm completion in the appropriate Super Validator operations Slack and email channels.

If GitHub configuration changes are required, the responsible operator should create the appropriate pull request and request review from the relevant maintainers. If the offboarding action also requires a Super Validator reward weight reduction, host SV weight adjustment, beneficiary-list update, or approved SV onboarding configuration change, the proposing operator should identify the applicable CIP process, including CIP-0111 where relevant, and ensure that the required follow-through is documented in the incident record.

### Step 6 - If the Vote Fails or Expires
If the vote fails or expires, the proposing operator should summarize the outcome in the incident record.

The summary should include:
- Vote outcome
- Whether the issue was resolved
- Whether additional monitoring is required
- Whether another escalation or vote may be needed
- Any agreed follow-up actions

## Post-Incident Documentation
Within 48 hours of the incident, the proposing operator should prepare a short incident summary.

The summary should include:
- Affected Super Validator node
- Incident timeline
- Initial reporter
- Escalation time
- Response time from affected operator
- Whether an offboarding vote was created
- Vote outcome
- Remediation completed
- Follow-up actions
- Any updates needed to monitoring, alerting, runbooks, contact lists, or GitHub configuration

The summary should be posted to the appropriate durable record.

Sensitive contact details, private infrastructure details, or confidential security information should not be included in the public repository.

## Quarterly Escalation Practice
Foundation Operations should coordinate a Super Validator escalation practice at least once per quarter.
### Purpose
The purpose of the escalation practice is to:
 
- Trigger the internal escalation procedures at each Super Validator.
- Confirm that escalation emails and alerting paths reach the correct operational contacts.
- Allow each Super Validator to provide evidence that its escalation methods worked.
- Identify outdated contacts, broken alerting paths, or gaps in internal escalation coverage before an actual incident.

### Anti-Goal
The purpose of the practice is not to test overnight wake-up procedures or unnecessarily alert operators during overnight hours.

Practice escalations should be scheduled to avoid overnight hours for the receiving operators whenever reasonably practical.

### Process
1. Foundation Operations assigns one Super Validator operator to send the practice escalation emails.
2. The assigned Super Validator sends escalation emails in two or three batches over an approximately six-hour period.
3. The batches should be scheduled to allow non-overnight alerts across major regions.
4. The earliest alerts should be sent to Asia and Europe.
   - The goal is to have it between 9-5 in Europe and US and reasonable time in Asia.
5. The next batch should be sent to the Americas.
6. Each Super Validator operator should acknowledge receipt and provide evidence that its internal escalation method worked.
7. Evidence may include confirmation that the alert reached the appropriate operations team, ticketing system, paging system, or other internal escalation mechanism.
8. Foundation Operations should record response times, missing acknowledgments, and any failed escalation paths.
9. Operators should correct broken contacts, stale distribution lists, or alerting issues identified during the practice.
10. Foundation Operations should summarize the practice results and follow-up actions.

The summary should not expose confidential escalation email addresses or private infrastructure details in the public repository.

