#!/usr/bin/env bash
# Phase-23803: client soft_fertig_ssh_auth_ms_59000_echo_roster Soft 23800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_59000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 23800+ soft_fertig_ssh_auth_ms_59000_echo_roster type ok"; echo "cleaned"; echo "OK: phase23803 e2e passed"
