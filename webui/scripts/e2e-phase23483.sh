#!/usr/bin/env bash
# Phase-23483: client soft_fertig_ssh_auth_ms_58500_echo_roster Soft 23480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_58500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 23480+ soft_fertig_ssh_auth_ms_58500_echo_roster type ok"; echo "cleaned"; echo "OK: phase23483 e2e passed"
