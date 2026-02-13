# Canton Network Validator Onboarding Guide

*Note: If you are only interested in setting up a validator node, you can set up a node on DevNet for practice, then jump to MainNet. If you’d like to build, test, or deploy an app, we recommend that you run a node on DevNet, TestNet, and MainNet.*

*Note: DevNet is accessible to any validator whose public IP has been approved and allowlisted, TestNet requires an invitation via an SV sponsor, MainNet requires an invitation via an SV sponsor and a separate slot assigned to your node or provided by the sponsor SV.*

## Optional: Use a Node-as-a-Service (NaaS) Provider

If you prefer not to operate infrastructure yourself, you may choose to work with a **Node-as-a-Service (NaaS)** provider.

A list of validator infrastructure providers that support the Canton Network is available here:

https://canton.foundation/validators/

These providers can manage deployment, operations, and maintenance of your validator node, and may also assist with onboarding and sponsorship coordination.

**Docs:**

- [DevNet](https://docs.dev.sync.global/)
- [TestNet](https://docs.test.sync.global/)
- [MainNet](https://docs.sync.global/)

**We highly recommend you join slack through slack connect**

[Visit this link for our Slack Channel guide](https://docs.sync.global/validator_operator/validator_onboarding.html#slack)

→ Your Slack workspace may allow you to browse to this channel, or you can ask your SV sponsor to send you an invitation. 

**Next Steps (DevNet):**

1. Provide the public IP of your environment, where you will set up the dev validator node, to your sponsor SV.
2. Periodically check the progress of whitelisting using [this instruction](https://docs.dev.sync.global/validator_operator/validator_onboarding.html#validating-that-your-ip-has-been-approved).
3. Once whitelisted by the majority of Super Validators, request an onboarding secret using the instructions from the `ONBOARDING_SECRET` block [here](https://docs.dev.sync.global/validator_operator/validator_helm.html#required-network-parameters).
4. Use the obtained onboarding secret to join the DevNet. If you face any issues, don't hesitate to ask for help at the #validator-operations or #validator-operations-onboarding Slack channel.

**Next Steps (TestNet and/or MainNet):**

- TestNet

Joining TestNet requires that you have been approved to join MainNet by the Tokenomics Committee of the Global Synchronizer Foundation. You can initiate a request to do so through https://canton.foundation/apply-to-set-up-a-validator-node/. Just like for DevNet, it also still requires your validator’s egress IP to be added to the allowlist, and it requires an onboarding secret from your SV sponsor.

- MainNet

MainNet requires everything TestNet requires, so approval by the Tokenomics committee, an IP on the allowlist, an onboarding secret from your SV sponsor, and a separate slot assigned to your node or provided by the sponsor SV.

**Stay Connected:**

Also, to stay up to date with changes and announcements from the Global Synchronizer Foundation, you should consider joining the following [mailing lists](https://docs.dev.sync.global/validator_operator/validator_onboarding.html#mailing-lists). 

* main
* cip-announce
* tokenomics-announce
* validator-announce

To join these lists, 

1. Create an account at groups.io
2. Go to lists.sync.global and sign up

## If You Do Not Have an SV Sponsor

If you do not yet have a Super Validator (SV) sponsor, the **Canton Foundation can act as your default sponsor** for initial onboarding.

You may submit your DevNet, TestNet, or MainNet public IP addresses directly to the Foundation for allowlisting using the form below:

**Foundation IP Whitelisting Form**  
https://forms.gle/cMU4nUEsz7sHVMmJ9

The Foundation will coordinate the allowlisting request with the Super Validator network. Standard adoption timelines (2–7 days) still apply.

## 1. Whitelist your IP for DevNet

Share your IP with your Super Validator sponsor. 

The Super Validator sponsor will submit a request to the other Super Validators. It will take between 2-7 days for other SVs to adopt this IP address.

*Note: If you’re wondering whether the Super Validator nodes have whitelisted your IP address, you can attempt to open the Scan UI of each Super Validator from your whitelisted IP, or simply, curl the Scan endpoints in the listed [Super Validator Node Information](https://canton.foundation/sv-network-status/).*

*For example, by using a command like this, and changing the input URL to each Scan URL offered by the Super Validators:*

	`curl https://scan.sv-1.dev.global.canton.network.sync.global/api/scan/v0/scans | jq`

## 2. Spin up your DevNet Node

Follow the steps detailed in the documentation below to spin up your node in preparation for joining DevNet.

## 3. Request a Secret from your SV Sponsor

Once ⅔ of the Super Validators have whitelisted your IP address, you’ll be able to join DevNet. To join, request an onboarding secret via API call (curl). 

Request approval to join MainNet. To do so: 

* Ask a Super Validator to sponsor you on MainNet
* Complete the Validator node request form here: [https://canton.foundation/apply-to-set-up-a-validator-node/](https://sync.global/validator-request/)
* Your application will be reviewed by the Tokenomics committee of the Global Synchronizer Foundation. 
* Requests are accepted, or rejected, after one week. 
* Accepted Validators are announced in the tokenomics-announce mailing list at https://lists.sync.global


## 4. Whitelist your IP for MainNet

Share your MainNet IP with your Super Validator sponsor. 

The Super Validator sponsor will submit a request to the other Super Validators.

Super Validators will check the status of your Validator Request before accepting your whitelisting request. 

As with DevNet, it will take between 2-7 days for other SVs to adopt this IP address.


## 5. Spin up your MainNet Node

Follow steps detailed in the docs to spin up your node on MainNet. At this point everything should be prepared to be deployed, and deployment will occur with the onboarding secret described in the next step. 


## 6. Request a Secret from your SV Sponsor

Request an onboarding secret from your SV sponsor via Slack to your sponsoring SV for TestNet & MainNet. 


