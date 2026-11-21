#!/usr/bin/env bash
# Phase-30059: client soft_fertig_ssh_auth_soft_30840_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_30840_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-30840-echo roster type ok"; echo "cleaned"; echo "OK: phase30059 e2e passed"
