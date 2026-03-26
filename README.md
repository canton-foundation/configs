# configs
SV configuration files and operational processes

# Structure

This repo contains documentation of Super Validator operational processes. These operational processes are non-binding guidelines agreed on by the Super Validator Operators during their weekly SV node operations call, and are intended to capture shared understanding at a given point in time. Any actual process implementation requires 2/3 of the Super Validators to agree to take a given action. 

The repo also contains a configuration directory per network: DevNet, TestNet, MainNet. In each, the configuration
parameters that the SVC agrees should be used for that network are documented. There are some
exceptions to this rule for either historical or practical reasons. Known exceptions are:
- `ui-config-values.yaml` - UI configuration values that are shared across all networks

# Runtime Configuration

For runtime configuration values (dso and amulet rules) see another repository:
https://github.com/canton-foundation/configs-runtime
