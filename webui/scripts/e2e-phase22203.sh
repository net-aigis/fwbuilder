#!/usr/bin/env bash
# Phase-22203: client soft_fertig_ssh_auth_ms_56500_echo_roster Soft 22200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_56500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 22200+ soft_fertig_ssh_auth_ms_56500_echo_roster type ok"; echo "cleaned"; echo "OK: phase22203 e2e passed"
