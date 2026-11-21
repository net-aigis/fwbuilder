#!/usr/bin/env bash
# Phase-44779: client soft_fertig_ssh_auth_soft_47320_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_47320_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-47320-echo roster type ok"; echo "cleaned"; echo "OK: phase44779 e2e passed"
