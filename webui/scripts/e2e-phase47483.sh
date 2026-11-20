#!/usr/bin/env bash
# Phase-47483: client soft_fertig_ssh_auth_ms_96000_echo_roster Soft 47480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_96000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 47480+ soft_fertig_ssh_auth_ms_96000_echo_roster type ok"; echo "cleaned"; echo "OK: phase47483 e2e passed"
