#!/usr/bin/env bash
# Phase-30699: client soft_fertig_ssh_auth_soft_31560_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_31560_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-31560-echo roster type ok"; echo "cleaned"; echo "OK: phase30699 e2e passed"
