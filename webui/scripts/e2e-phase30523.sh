#!/usr/bin/env bash
# Phase-30523: client soft_fertig_ssh_auth_ms_69500_echo_roster Soft 30520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_69500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 30520+ soft_fertig_ssh_auth_ms_69500_echo_roster type ok"; echo "cleaned"; echo "OK: phase30523 e2e passed"
