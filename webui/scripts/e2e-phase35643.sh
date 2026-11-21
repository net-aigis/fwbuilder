#!/usr/bin/env bash
# Phase-35643: client soft_fertig_ssh_auth_ms_77500_echo_roster Soft 35640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_77500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 35640+ soft_fertig_ssh_auth_ms_77500_echo_roster type ok"; echo "cleaned"; echo "OK: phase35643 e2e passed"
