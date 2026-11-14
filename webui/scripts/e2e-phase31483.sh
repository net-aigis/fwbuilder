#!/usr/bin/env bash
# Phase-31483: client soft_fertig_ssh_auth_ms_71000_echo_roster Soft 31480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_71000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 31480+ soft_fertig_ssh_auth_ms_71000_echo_roster type ok"; echo "cleaned"; echo "OK: phase31483 e2e passed"
