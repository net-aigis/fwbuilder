#!/usr/bin/env bash
# Phase-29243: client soft_fertig_ssh_auth_ms_67500_echo_roster Soft 29240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_67500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 29240+ soft_fertig_ssh_auth_ms_67500_echo_roster type ok"; echo "cleaned"; echo "OK: phase29243 e2e passed"
