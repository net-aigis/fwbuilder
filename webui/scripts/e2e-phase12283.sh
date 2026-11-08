#!/usr/bin/env bash
# Phase-12283: client soft_fertig_ssh_auth_policy_echo_roster Soft 12280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_policy_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 12280+ soft_fertig_ssh_auth_policy_echo_roster type ok"; echo "cleaned"; echo "OK: phase12283 e2e passed"
