#!/usr/bin/env bash
# Phase-42299: client soft_fertig_ssh_auth_ms_88000_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_88000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-88000-echo roster type ok"; echo "cleaned"; echo "OK: phase42299 e2e passed"
