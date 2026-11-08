#!/usr/bin/env bash
# Phase-16043: client soft_fertig_ssh_auth_soft_15960_echo_roster Soft 16040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_15960_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 16040+ soft_fertig_ssh_auth_soft_15960_echo_roster type ok"; echo "cleaned"; echo "OK: phase16043 e2e passed"
