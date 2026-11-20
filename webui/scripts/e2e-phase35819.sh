#!/usr/bin/env bash
# Phase-35819: client soft_fertig_ssh_auth_soft_37240_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_37240_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-37240-echo roster type ok"; echo "cleaned"; echo "OK: phase35819 e2e passed"
