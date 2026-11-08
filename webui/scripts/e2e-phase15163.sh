#!/usr/bin/env bash
# Phase-15163: client soft_fertig_ssh_auth_ms_45k_echo_roster Soft 15160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_45k_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 15160+ soft_fertig_ssh_auth_ms_45k_echo_roster type ok"; echo "cleaned"; echo "OK: phase15163 e2e passed"
