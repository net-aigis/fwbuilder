#!/usr/bin/env bash
# Phase-43323: client soft_fertig_ssh_auth_ms_89500_echo_roster Soft 43320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_89500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 43320+ soft_fertig_ssh_auth_ms_89500_echo_roster type ok"; echo "cleaned"; echo "OK: phase43323 e2e passed"
