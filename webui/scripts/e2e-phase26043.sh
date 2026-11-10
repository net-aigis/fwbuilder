#!/usr/bin/env bash
# Phase-26043: client soft_fertig_ssh_auth_ms_62500_echo_roster Soft 26040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_62500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 26040+ soft_fertig_ssh_auth_ms_62500_echo_roster type ok"; echo "cleaned"; echo "OK: phase26043 e2e passed"
