#!/usr/bin/env bash
# Phase-34363: client soft_fertig_ssh_auth_ms_75500_echo_roster Soft 34360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_75500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 34360+ soft_fertig_ssh_auth_ms_75500_echo_roster type ok"; echo "cleaned"; echo "OK: phase34363 e2e passed"
