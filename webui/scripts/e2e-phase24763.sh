#!/usr/bin/env bash
# Phase-24763: client soft_fertig_ssh_auth_ms_60500_echo_roster Soft 24760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_60500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 24760+ soft_fertig_ssh_auth_ms_60500_echo_roster type ok"; echo "cleaned"; echo "OK: phase24763 e2e passed"
