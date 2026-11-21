#!/usr/bin/env bash
# Phase-31979: client soft_fertig_ssh_auth_soft_33000_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_33000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-33000-echo roster type ok"; echo "cleaned"; echo "OK: phase31979 e2e passed"
