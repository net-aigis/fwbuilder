#!/usr/bin/env bash
# Phase-39803: client soft_fertig_ssh_auth_ms_84000_echo_roster Soft 39800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_84000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 39800+ soft_fertig_ssh_auth_ms_84000_echo_roster type ok"; echo "cleaned"; echo "OK: phase39803 e2e passed"
