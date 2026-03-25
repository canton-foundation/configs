## SV Locking Operational Guidelines

[CIP-0105](https://github.com/canton-foundation/cips/blob/main/cip-0105/cip-0105.md) **Transitional Enforcement**

[CIP-0105 has been approved. ](https://github.com/canton-foundation/cips/blob/main/cip-0105/cip-0105.md)

Given its approval date on March 2,  the SV locking process defined in the CIP will begin on or soon after April 1st, 2026, with the final date to be determined by the Super Validators and announced by the Foundation. Adoption will be contingent on at least one public dashboard (described below) going live. 

This document provides guidelines for implementing CIP-0105 during the “Transitional Enforcement” period. We expect this period to last for several months. 

#### Key Points : 

1. Each Super Validator will report to the Foundation the PartyID for each of the wallets it plans to use for locking its SV rewards in compliance with this CIP. These PartyIDs must not commingle funds with other holders.
2. Each Super Validator must also report to the Foundation the partyID for any wallet used to manage the unlocking process when it unlocks previously locked balances. 
3. The Foundation will provide the PartyIDs for these wallets to public dashboard providers, and will rely on public dashboard calculations to apply any penalties and to enforce unlock vesting rates.
4. The Foundation will initiate a vote to reduce minting weight for any Super Validator that falls below one of the defined thresholds. 

#### How to report your PartyIDs to the Foundation:
Super Validators who choose to retain SV rewards weights as described in CIP--0105 will need to send the following information to sv@canton.foundation 
 - All PartyIds used for locked balances
 - Any PartyIds used for unlocking balances

## Penalty Process

#### Reducing an SV weight
Any Super Validator that falls below the required Canton Coin locked amount for its current rewards tier will be immediately flagged for a reduction in its SV weight. On a daily basis, the Foundation will initiate an onchain vote proposal to reduce the weight of any Super Validator, and Super Validator operators will vote on that proposal with a threshold deadline of seven days, and proposal set at threshold. 

The vote proposal will state the date when the SV in question dropped below the required threshold, and this date will be used as the start of the 30 day time period during which the SV may restore that weight. This “start date” may be earlier than the same date that the weight reduction vote proposal was initiated. 

#### Restoring an SV Weight
Super Validators may increase their weight if they increase their locked balance to the current required threshold for the given weight. SVs that have fallen below a given threshold must restore that weight within 30 days, or that higher threshold will become permanently unavailable to them, and they will not be able to restore to the related SV weight. 

To restore their weight, the Super Validator must meet the required balance threshold in reported locking wallets by the end of the **30th day after the date**–indicated in the vote record onchain–when the SV fell below the required threshold, counting dates as ending 7 pm US Pacific Time. For example, if the SV falls below threshold on May 2nd, the end of the first day will be 7 pm US Pacific Time on May 3rd, and the end of the 30th day will be 7 pm US Pacific Time on **June 1st**. 

If they wish to avoid permanent removal of their SV weight, Super Validators must notify the Foundation that they have met the required threshold, using the email sv@canton.foundation, before then end of the 30th day as described above. Foundation staff will validate this using public dashboards. 

If the Super Validator does not meet their locking threshold by the end of the 30th day, the Foundation will initiate a vote proposal with a threshold deadline on the 37th day (independent of weekends and holidays), with effectivity at threshold. 

#### Super Validator Escrow

Super Validators that are earning rewards in escrow via SV reward coupons must maintain above threshold for their actually earned rewards in order to qualify for their overall SV weight. 

SVs that fall below a threshold on their actually earned rewards will have their total weight reduced across all milestones. 


#### Live Metrics

Publicly available dashboard, or dashboards, will report the following details:
1. Total SV rewards earned up to the end of the issuance (minting) phase of the most recently closed round
2. Current "locked" amount across all reported locking wallets controlled by that Super Validator

    - (a) List partyID and locked amounts of all locking wallets  
    - (b) Report aggregate total locked for each Super Validator

3. Percent of total earned rewards currently in the locking wallets
4. Number of rounds within the past 35 days when the locked amount dropped below the defined thresholds (and the round number(s) when this happened). 
   - (a) 70%
   - (b) 65%
   - (c) 60%
   - (d) 55%
   - (e) 50%
   - (f) 45%
   - (g) 35%

5. Current SV reward tier and weight
6. Implied New Tier and SV weight based on locked amount (calculated by round) in case of any changes
   - (a) New implied SV weight, if any
   - (b)Days since the SV’s implied weight changed (days since the SV’s locked balance went below its current threshold, or returned above its prior threshold ). 
Status of (and link to) active onchain proposal (if any) to change this SV's weight. 
Unlocked amount by tranche
Currently vested unlocked balance by tranche
Remaining unvested unlocked balance by tranche

## Recommended Best Practices

SVs are strongly encouraged to:
 - maintain a compliance buffer above the minimum threshold
- pre-fund expected future locking needs on a weekly basis where practical
- review dashboard data regularly
- avoid initiating unlocks without modeling tier impact first
- ensure custodians understand the distinction between locked and unlocking balances
- document internal treasury workflows that affect locking balances
- notify the Foundation before major wallet or custodian migrations where possible

## Contact and Notices

Questions, updated PartyId disclosures, and operational notices relating to this policy should be submitted to the Foundation through sv@canton.foundation

Can we keep locked coins at a custodian?
 - Yes, any wallets used for locked coins need to be disclosed and can be in a custodian. 

What are the general timelines for locking?
- Manual process will start 2026-04-01 The automated process will kick off 3 to 6 months later. If SVs act in good faith, presenting their understanding of how to manage  movements among accounts and adhering to their own processes, there will be time for SVs to come to a common understanding. 



Frequently Asked Questions
1. **Is the lock on-chain during Phase 1?**
 - No. During Phase 1, locking is represented by balances held in disclosed wallets or custodial accounts. On-chain automation is expected in Phase 2.
2. **Are the tiers static percentages or do they require a separate minimum lock period?**
 - The tiers are based on maintaining the required percentage of aggregate lifetime earned rewards as actively locked at all times. There is no separate fixed lock term beyond the vesting based unlock model.
3. **How do unlock tranches work?**
 - When an SV moves a balance out of its locking structure into a disclosed unlocking structure, that amount begins vesting out at a rate of 1/365.25 per day. Unlocked balances do not contribute to the SV’s locked total, even when those unlocked balanced have not vested. 
4. **Can an SV update its disclosed PartyIds during Phase 1?**
 - Yes. SVs should notify the Foundation promptly whenever they add, remove, or migrate locking or unlocking PartyIds.
5. **Can locked balances be held with a custodian?**
 - Yes. Locked balances may be held in self custody, at an institutional custodian, or through a qualified third party custody provider.
6. **Can the locking requirement be met across multiple PartyIds?**
 - Yes. Compliance is calculated on an aggregate basis across all disclosed locking PartyIds attributable to that SV.
7. **Can locked balances be transferred among registered PartyIds?**
 - Yes, provided the balances remain within the disclosed locking structure and are not being unlocked outside the vesting rules.
8. **Who provides the cumulative rewards figure?**
 - During Phase 1, the Foundation expects public dashboards to provide the primary calculation basis, subject to public auditability and operational review.
9. **How should newly earned rewards be handled?**
 - Because future rewards increase the denominator for compliance, SVs should plan to maintain their target percentage on a round-by-round rolling basis. In practice, many SVs may choose to hold a buffer above the threshold.
10. **What are the expected timelines?**
 - Phase 1 Transitional Enforcement begins **April 1, 2026**. Phase 2 automation is still TBD.
