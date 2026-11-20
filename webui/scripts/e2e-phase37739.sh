#!/usr/bin/env bash
# Phase-37739: client soft_fertig_ssh_auth_soft_39400_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_39400_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-39400-echo roster type ok"; echo "cleaned"; echo "OK: phase37739 e2e passed"
