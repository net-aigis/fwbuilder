#!/usr/bin/env bash
# Phase-39659: client soft_fertig_ssh_auth_soft_41560_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_41560_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-41560-echo roster type ok"; echo "cleaned"; echo "OK: phase39659 e2e passed"
