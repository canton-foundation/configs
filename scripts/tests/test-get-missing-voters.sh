#!/usr/bin/env bash

set -euo pipefail

SCRIPT=$(cd "$(dirname "$0")/.." && pwd)/get-missing-voters.sh

# Keep all requests local to the test; jq still parses the real response shapes.
# The exported function is called by the child bash process.
# shellcheck disable=SC2329
curl() {
  local url="${*: -1}"
  if [[ $url == *"${FAIL_HOST:-no-failure}"*"${FAIL_ENDPOINT:-no-failure}" ]]; then
    echo 'curl: simulated request failure' >&2
    return 22
  fi

  case $url in
    */dso)
      echo '{"dso_rules":{"contract":{"payload":{"svs":[["sv-a",{"name":"SV A"}],["sv-b",{"name":"SV B"}]]}}}}'
      ;;
    */voterequests)
      echo "${VOTE_REQUESTS}"
      ;;
    *) return 2 ;;
  esac
}
export -f curl

export VOTE_REQUESTS='{"dso_rules_vote_requests":[]}'
failures=0

check() {
  local name=$1 expected_status=$2 expected_message=$3
  local output status=0
  output=$(bash "$SCRIPT" 2 2>&1) || status=$?
  if [[ $status -ne $expected_status || $output != *"$expected_message"* ]]; then
    printf 'FAIL: %s (status %s, expected %s)\n%s\n' "$name" "$status" "$expected_status" "$output"
    failures=$((failures + 1))
  else
    printf 'PASS: %s\n' "$name"
  fi
}

check 'no open votes' 0 'No missing voters found.'

for host in docs.dev. docs.test. docs.global.; do
  for endpoint in /dso /voterequests; do
    export FAIL_HOST="$host" FAIL_ENDPOINT="$endpoint"
    check "$host$endpoint request failure" 1 'simulated request failure'
  done
done
unset FAIL_HOST FAIL_ENDPOINT

export VOTE_REQUESTS='{"dso_rules_vote_requests":[{"payload":{"voteBefore":null,"votes":[["SV A",{}]]}}]}'
check 'missing vote' 1 'MainNet: SV B'

export VOTE_REQUESTS='{"dso_rules_vote_requests":[{"payload":{"voteBefore":null,"votes":[["SV A",{}],["SV B",{}]]}}]}'
check 'all votes cast' 0 'No missing voters found.'

exit "$failures"
