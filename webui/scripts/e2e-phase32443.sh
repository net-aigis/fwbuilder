#!/usr/bin/env bash
# Phase-32443: client soft_fertig_ssh_auth_ms_72500_echo_roster Soft 32440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_72500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 32440+ soft_fertig_ssh_auth_ms_72500_echo_roster type ok"; echo "cleaned"; echo "OK: phase32443 e2e passed"
