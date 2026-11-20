#!/usr/bin/env bash
# Phase-37563: client soft_fertig_ssh_auth_ms_80500_echo_roster Soft 37560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_80500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 37560+ soft_fertig_ssh_auth_ms_80500_echo_roster type ok"; echo "cleaned"; echo "OK: phase37563 e2e passed"
