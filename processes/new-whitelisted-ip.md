## How to Ask for a New Whitelisted IP Process

### Purpose
This process defines how to request the addition of a new IP address to the `configs/<network>/allowed-ip-ranges.json` in file [configs-private](https://github.com/global-synchronizer-foundation/configs-private), which is used to whitelist IPs for access to Canton network nodes, tools, or monitoring interfaces.

### Process

#### 1. Prepare the Change and Submit a Pull Request
Submit a pull request (PR) to the GitHub repository: [canton-foundation/configs-private](https://github.com/canton-foundation/configs-private). If you are not a maintainer, create it via a GitHub fork.

When preparing the PR, consider the following:
 - Make changes in the file `configs/<network>/allowed-ip-ranges.json` where `<network>` is the network you wish to add the IP for (DevNet, TestNet or MainNet)
 - Identify the section where the IP should be added: `svs, validators, vpns` or `read-only clients`
 - Entries under `validators` or `read-only clients` must contain both the name of the validator (or organization requesting read-only access) and the name of the operator running the node on their behalf. If they operate their own node, include the sponsor SV instead. Separate the two with " / ".
 - Ensure that all entries and IP addresses are sorted alphabetically. The CI will fail your PR if they are not.

### Clarifications

- Max 3 IP’s allowed per cluster, unless an exception is approved at the SV Ops call.
- All requests for up to 3 IP’s per cluster will be automatically approved if submitted as a pull request, without requiring the requestor to attend the SV Ops call.
- For TestNet & MainNet, the operator must have a Validator allocation before granting the IPs. Approval of the organization by the tokenomics committee is not an allocation: each validator node needs its own allocation, and the number of IPs may not exceed 3 per allocated validator node. TestNet IPs are counted against the MainNet allocation.
- Allow any entity to operate validator nodes on DevNet, TestNet and MainNet from behind the same egress IP address.

If adding IP for a validator on **TestNet** or **MainNet**, the PR description must contain:

 - Justification: Provide a link to an announcement confirming that the validator has been approved by the tokenomics committee or a statement naming the operator (from the list of operators approved by the tokenomics committee to onboard validators at their discretion) under whose discretion the validator is added.
 - Allocation: Provide a link to the validator allocation announcement on supervalidator-announce, and state the number of allocated validator nodes and the number of IPs requested.

You can use the script [new-whitelist.sh](https://github.com/global-synchronizer-foundation/configs-private/blob/main/scripts/new-whitelist.sh), which automates most of the steps above, including PR creation.

#### 2. Get the PR reviewed and merged

 - A maintainer from a different organization than the submitter should approve and merge the PR. If the submitter is a maintainer, they can merge the PR after receiving approval from another maintainer from a different organization.
 - For TestNet & MainNet, the reviewer should check that the number of IPs does not exceed 3 per allocated validator node.
 - No change to the seven-day window for updating the rules.



## How to Request Read-Only Access for Your IP Address

### Purpose

This process allows an IP address to reach the **scan endpoint** of the **SV**. It will not be able to access other components such as the **sequencer** or **CometBFT**. The primary purpose is to serve read-only applications such as **chain analytics** or **explorers**.

### Process

Similar to the `"How to Ask for a New Whitelisted IP Process"` section above, you will need to submit a **PR** (Pull Request) to the same repository and file.

For each network, locate the `read-only clients` section in the `configs/<network>/allowed-ip-ranges.json` file and add a new element in this format:

```
"<org-name> / <sponsor-name>" : [
  "ip1/32",
  "ip2/32"
]
```
The key needs to be sorted.

```
jq '."read-only clients" |= (to_entries | sort_by(.key | ascii_downcase) | from_entries)' configs/<(DevNet|Testnet|Mainnet)>/allowed-ip-ranges.json > tmp.json && mv tmp.json configs/MainNet/allowed-ip-ranges.json
```

Alternatively, you can use the script [new-whitelist.sh](https://github.com/global-synchronizer-foundation/configs-private/blob/main/scripts/new-whitelist.sh), which automates most of the steps above, including PR creation.

Currently, only individual IPs are allowed, so you will need to explicitly write out multiple /32 entries if you have a range. There isn't an official limit on how many IPs are allowed, but keep it fewer than three.

When submitting the PR, briefly provide information about:

 - The application and the organization
 - The access pattern your app will generate
 - Your plan to ensure a reasonable request rate to the scan application, especially spreading the load across SV scans to avoid overloading an individual scan. Overloading may result in your IP being rate-limited and blocked by certain SVs.
