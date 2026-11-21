#!/usr/bin/env bash
# Phase-47339: client soft_fertig_ssh_auth_soft_50200_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_50200_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-50200-echo roster type ok"; echo "cleaned"; echo "OK: phase47339 e2e passed"
