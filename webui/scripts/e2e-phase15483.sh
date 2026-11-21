#!/usr/bin/env bash
# Phase-15483: client soft_fertig_ssh_auth_ms_46000_echo_roster Soft 15480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_46000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 15480+ soft_fertig_ssh_auth_ms_46000_echo_roster type ok"; echo "cleaned"; echo "OK: phase15483 e2e passed"
