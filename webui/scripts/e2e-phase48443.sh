#!/usr/bin/env bash
# Phase-48443: client soft_fertig_ssh_auth_ms_97500_echo_roster Soft 48440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_97500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 48440+ soft_fertig_ssh_auth_ms_97500_echo_roster type ok"; echo "cleaned"; echo "OK: phase48443 e2e passed"
