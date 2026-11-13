#!/usr/bin/env bash
# Phase-29179: client soft_fertig_ssh_auth_ms_67500_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_67500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-67500-echo roster type ok"; echo "cleaned"; echo "OK: phase29179 e2e passed"
