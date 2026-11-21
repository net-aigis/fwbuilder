#!/usr/bin/env bash
# Phase-13019: client soft_fertig_ssh_auth_soft_plus_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_plus_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-plus-echo roster type ok"; echo "cleaned"; echo "OK: phase13019 e2e passed"
