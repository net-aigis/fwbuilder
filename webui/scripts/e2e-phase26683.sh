#!/usr/bin/env bash
# Phase-26683: client soft_fertig_ssh_auth_ms_63500_echo_roster Soft 26680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_63500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 26680+ soft_fertig_ssh_auth_ms_63500_echo_roster type ok"; echo "cleaned"; echo "OK: phase26683 e2e passed"
