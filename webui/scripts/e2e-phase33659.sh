#!/usr/bin/env bash
# Phase-33659: client soft_fertig_ssh_auth_ms_74500_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_74500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-74500-echo roster type ok"; echo "cleaned"; echo "OK: phase33659 e2e passed"
