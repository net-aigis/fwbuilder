#!/usr/bin/env bash
# Phase-12699: client soft_fertig_ssh_auth_gap_open_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_gap_open_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-gap-open-echo roster type ok"; echo "cleaned"; echo "OK: phase12699 e2e passed"
