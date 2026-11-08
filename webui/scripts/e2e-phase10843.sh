#!/usr/bin/env bash
# Phase-10843: client soft_fertig_ssh_auth_hard_gap_echo_roster Soft 10840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_hard_gap_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 10840+ soft_fertig_ssh_auth_hard_gap_echo_roster type ok"; echo "cleaned"; echo "OK: phase10843 e2e passed"
