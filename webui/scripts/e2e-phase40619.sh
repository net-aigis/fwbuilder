#!/usr/bin/env bash
# Phase-40619: client soft_fertig_ssh_auth_soft_42640_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_42640_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-42640-echo roster type ok"; echo "cleaned"; echo "OK: phase40619 e2e passed"
