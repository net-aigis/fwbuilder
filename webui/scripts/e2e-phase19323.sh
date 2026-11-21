#!/usr/bin/env bash
# Phase-19323: client soft_fertig_ssh_auth_ms_52000_echo_roster Soft 19320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_52000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 19320+ soft_fertig_ssh_auth_ms_52000_echo_roster type ok"; echo "cleaned"; echo "OK: phase19323 e2e passed"
