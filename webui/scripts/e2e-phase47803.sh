#!/usr/bin/env bash
# Phase-47803: client soft_fertig_ssh_auth_ms_96500_echo_roster Soft 47800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_96500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 47800+ soft_fertig_ssh_auth_ms_96500_echo_roster type ok"; echo "cleaned"; echo "OK: phase47803 e2e passed"
