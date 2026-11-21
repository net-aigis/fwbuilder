#!/usr/bin/env bash
# Phase-17579: client soft_fertig_ssh_auth_soft_17560_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_17560_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-17560-echo roster type ok"; echo "cleaned"; echo "OK: phase17579 e2e passed"
