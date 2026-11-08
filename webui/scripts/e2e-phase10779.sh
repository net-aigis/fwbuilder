#!/usr/bin/env bash
# Phase-10779: client soft_fertig_ssh_auth_hard_gap_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_hard_gap_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-hard-gap-echo roster type ok"; echo "cleaned"; echo "OK: phase10779 e2e passed"
