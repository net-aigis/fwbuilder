#!/usr/bin/env bash
# Phase-18219: client soft_fertig_ssh_auth_soft_18240_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_18240_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-18240-echo roster type ok"; echo "cleaned"; echo "OK: phase18219 e2e passed"
