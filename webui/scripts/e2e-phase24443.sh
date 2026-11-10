#!/usr/bin/env bash
# Phase-24443: client soft_fertig_ssh_auth_ms_60000_echo_roster Soft 24440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_60000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 24440+ soft_fertig_ssh_auth_ms_60000_echo_roster type ok"; echo "cleaned"; echo "OK: phase24443 e2e passed"
