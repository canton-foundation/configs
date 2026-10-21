#!/usr/bin/env bash

# check-svs.sh
# This script checks approved-sv-id-values.yaml files for duplicate SV IDs
# and malformed SV names

set -euo pipefail

SCRIPTS_DIR=$(dirname "$0")

sv_ids_exclude=(${SV_IDS_EXCLUDE:-})

sv_ids_exclude_json=$(
  printf '%s\n' "${sv_ids_exclude[@]}" |
  jq -nR '[inputs]'
)

approved_sv_ids_files=(
  "$SCRIPTS_DIR"/../configs/*/approved-sv-id-values.yaml
)

approved_sv_ids=$(for f in "${approved_sv_ids_files[@]}"; do cat "$f" | yq -o json; done)

jq_functions='
  # input: array
  # output: arrays with unique elements
  def select_dups:
    group_by(.) | map(select(length>1) | .[0])
  ;
'

jq_included_svs='
  [inputs]
  | map(.approvedSvIdentities[] | select(.publicKey | IN($sv_ids_exclude[]) | not))
'

sv_id_dups=$(
  echo "$approved_sv_ids" |
  jq -nr --argjson sv_ids_exclude "$sv_ids_exclude_json" "$jq_functions$jq_included_svs"'
    | map(.publicKey)
    | select_dups[] | "- " + .
  '
)

sv_malformed_names=$(
  echo "$approved_sv_ids" |
  jq -nr --argjson sv_ids_exclude "$sv_ids_exclude_json" "$jq_included_svs"'
    | map(.name)[]
    # CIP-127 only allows SV names with alphanumeric characters and hyphens
    # See the note about fat-finger protection: https://github.com/canton-foundation/cips/blob/main/cip-0127/cip-0127.md#lock-actions
    | select(test("^[a-z0-9-]+$"; "i") | not)
    | "- " + .
  '
)

exit_code=0

if [[ -n "$sv_id_dups" ]]; then
  echo "ERROR: The following duplicate SV IDs were found:"
  echo "$sv_id_dups"
  exit_code=1
fi

if [[ -n "$sv_malformed_names" ]]; then
  echo "ERROR: The following malformed SV names were found:"
  echo "$sv_malformed_names"
  exit_code=1
fi

if [[ $exit_code -ne 0 ]]; then
  exit "$exit_code"
else
  echo "INFO: No duplicate SV IDs or malformed names found."
fi
