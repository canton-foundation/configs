## SV Locking Operational Guidelines

[CIP-0105](https://github.com/canton-foundation/cips/blob/main/cip-0105/cip-0105.md) **Transitional Enforcement**

[CIP-0105 has been approved. ](https://github.com/canton-foundation/cips/blob/main/cip-0105/cip-0105.md)

Given its approval date on March 2,  the SV locking process defined in the CIP will begin on or soon after April 1st, 2026, with the final date to be determined by the Super Validators and announced by the Foundation. Adoption will be contingent on at least one public dashboard (described below) going live. 

This document provides guidelines for implementing CIP-0105 during the “Transitional Enforcement” period. We expect this period to last for several months. 

#### Key Points : 

1. Each Super Validator will report to the Foundation the PartyID for each of the wallets it plans to use for locking its SV rewards in compliance with this CIP. These PartyIDs must not commingle funds with other holders.
2. Each Super Validator must also report to the Foundation the partyID for any wallet used to manage the unlocking process any time it plans to unlock previously locked balances. 
3. The Foundation will provide the PartyIDs for these wallets to public dashboard providers, and will rely on public dashboard calculations to apply any penalties and to enforce unlock vesting rates.
4. The Foundation will initiate an onchain vote to reduce minting weight for any Super Validator that falls below one of the defined thresholds. 

#### How to report your PartyIDs to the Foundation:
Super Validators who choose to retain SV rewards weights as described in CIP--0105 will need to send the following information to sv@canton.foundation 
 - All PartyIds controlling locked balances
 - Any PartyIds controlling unlocked balances

## Penalty Process

#### Reducing an SV weight
Any Super Validator that falls below the required Canton Coin locked amount for its current rewards tier for fifty (50) minutes--approximately equivalent to one full minting round--will be immediately flagged for a reduction in its SV weight. On a daily basis, Foundation operational staff will initiate an onchain vote proposal to reduce the weight of any such Super Validator, and Super Validator operators will vote on that proposal with a threshold deadline of seven days, and effectivity at eight days. 

The vote proposal will state the date when the SV in question dropped below the required threshold, and the date when they fell below threshold will be used as the start of the 30 day time period during which the SV may restore that weight. This “start date” may be earlier than the date when the weight reduction vote proposal was initiated. 

#### Restoring an SV Weight
Super Validators may return to a prior discount tier by increasing their locked balance to the current required threshold for the given tier. SVs whose balance has fallen below the threshold required for a given tier must restore the required balance within 30 days, or that higher tier will become permanently unavailable to them. 

To restore their weight, the Super Validator must meet the required balance threshold in reported locking wallets by the end of the **30th day after the date**–indicated in the vote record onchain–when the SV fell below the required threshold, counting dates as ending 7 pm US Pacific Time. 

**For example**, if the SV falls below threshold on May 2nd, the end of the first day will be 7 pm US Pacific Time on May 3rd, and the end of the 30th day will be 7 pm US Pacific Time on **June 1st**. 

To move out of a penalty state and return to a higher tier, Super Validators must notify the Foundation that they have met the required threshold, using the email sv@canton.foundation, before then end of the 30th day as described above. Foundation staff will validate this using public dashboards. 

If the Super Validator does not meet their locking threshold by the end of the 30th day, and that Super Validator's weight has been reduced to zero (0), Foundation operational staff will initiate a vote proposal to **offboard that Super Validator from the Global Synchronizer,** with a threshold deadline on the 37th day (inclusive of weekends and holidays), with effectivity on the 38th day. 

#### Super Validator Escrow

Super Validators that are earning rewards in escrow via SV reward coupons must maintain a locked balance **above the threshold for their actually minted rewards** in order to qualify for their overall SV weight. 

If a Super Validator falls below a threshold and receives a lower weight as a result, that lower weight will apply to any mints from escrow performed while that SV has the lower weight. SVs will not mint from escrow at a higher (or lower) weight that may have been active when a given escrow coupon was generated. 

#### Lock Substitution

Super Validators may borrow Canton Coin in order to meet their locking threshold. In these cases, it may be necessary for the Super Valdiator to switch from one loan provider to another. When switching from one loan provider to another the Super Validator has a 24-hour period during which they may raise their balance above threshold by adding a locking wallet containing a balance from a new loan provider, and then remove Canton Coin from an existing locking wallets to repay an existing loan provider.

In more detail: Super Validators are allowed a 24-hour period when they may add Canton Coin above their required threshold--in a separate wallet--then swap out the above-threshold amount from a different wallet. If the Super Validator completes this process in less than 24 hours, the transfer-out for the over-staked (above threshold) amount would be allowed without going through an unlocking wallet or vesting schedule. The balance **must** first go above threshold for this workflow to be allowed. Dropping below threshold will result in a penalty. The goal of this workflow is to allow SVs to meet their threshold requirements while changing change loan providers. 

#### Live Metrics

Publicly available dashboards relied on by the Foundation must report at least following details:
1. Total SV rewards earned up to the end of the issuance (minting) phase of the most recently closed round, where "closed" in this context means "the issuance phase of the round has ended", that is, the round is entirely complete. 
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
   - (b) Days since the SV’s implied weight changed (days since the SV’s locked balance went below its current threshold, or returned above its prior threshold ). 
Status of (and link to) active onchain proposal (if any) to change this SV's weight. 
Unlocked amount by tranche
Currently vested unlocked balance by tranche
Remaining unvested unlocked balance by tranche

## Recommended Best Practices

SVs are strongly encouraged to:
 - maintain a compliance buffer above the minimum threshold
- pre-fund expected future locking needs on a weekly basis where practical
- review dashboard data regularly
- model the tier impact of an unlock before moving Canton Coin to an unlocking wallet PartyID
- ensure custodians understand the distinction between locked and unlocking balances
- document internal treasury workflows that affect locking balances
- notify the Foundation before major wallet or custodian migrations where possible

## Contact and Notices

Questions, updated PartyId disclosures, and operational notices relating to this policy should be submitted to the Foundation through sv@canton.foundation

## Frequently Asked Questions

1. **Can we keep locked coins at a custodian?**
   
   Yes, any wallets used for locked coins need to be disclosed and can be in a custodian. 

2. **What are the general timelines for locking?**

   Manual process will start on or after 2026-04-01, with the final activation date to be announced by the Foundation after consultation with the Super Validators.  The automated process will kick off 3 to 6 months later.
   
3. **Is the lock on-chain during Phase 1?**
   
   No. During Phase 1, locking is represented by balances held in disclosed wallets or custodial accounts. On-chain automation is expected in Phase 2.
   
4. **Are the tiers static percentages or do they require a separate minimum lock period?**
   
   The tiers are based on maintaining the required percentage of aggregate lifetime earned rewards as actively locked at all times. There is no separate fixed lock term beyond the vesting based unlock model. Penalties will be applied if balances fall below threshold for fifty (50) minutes--approximately the length of one full minting round.
   
5. **How do unlock tranches work?**
   
   When an SV moves a balance out of its locking structure into a disclosed unlocking structure, that amount begins vesting out at a rate of 1/365.25 per day. Super Validators may move or liquidate the vested Canton Coin balance in a given unlocking wallet. Unlocked balances do not contribute to the SV’s locked total, even when those unlocked balanced have not vested.
   
6. **Can an SV update its disclosed PartyIds during Phase 1?**
   
   Yes. SVs should notify the Foundation promptly whenever they add, remove, or migrate locking or unlocking PartyIds.
   
7. **Can locked balances be held with a custodian?**
   
   Yes. Locked balances may be held in self custody, at an institutional custodian, or another custodial service, provided those balances are held in dedicated wallets that     contain only funds controlled by the Super Validator.
   
8. **Can the locking requirement be met across multiple PartyIds?**
   
   Yes. Compliance is calculated on an aggregate basis across all disclosed locking PartyIds attributable to that SV.
   
9. **Can locked balances be transferred among registered PartyIds?**
    
   Yes, provided the balances remain within the disclosed locking structure and are not being unlocked outside the vesting rules.
   
10. **Who provides the cumulative rewards figure?**

      During Phase 1, the Foundation expects public dashboards to provide the primary calculation basis, subject to public auditability and operational review.

11. **How should newly earned rewards be handled?**

      Because future rewards increase the denominator for compliance, SVs should plan to maintain their target percentage on a round-by-round rolling basis. In practice, many SVs may choose to hold a buffer above the threshold.

12. **What are the expected timelines?**

      Phase 1 Transitional Enforcement begins on or after **April 1, 2026**. Final date will be announced by the Foundation after confirmation by the Super Validators.

      Phase 2 automation will be scheduled after the necessary automated locking tools are available.
