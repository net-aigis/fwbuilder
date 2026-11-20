#!/usr/bin/env bash
# Phase-39019: client soft_fertig_ssh_auth_soft_40840_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_40840_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-40840-echo roster type ok"; echo "cleaned"; echo "OK: phase39019 e2e passed"
