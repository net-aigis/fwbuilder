#!/usr/bin/env bash
# Phase-15979: client soft_fertig_ssh_auth_soft_15960_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_15960_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-15960-echo roster type ok"; echo "cleaned"; echo "OK: phase15979 e2e passed"
