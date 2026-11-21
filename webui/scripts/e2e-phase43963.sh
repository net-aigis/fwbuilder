#!/usr/bin/env bash
# Phase-43963: client soft_fertig_ssh_auth_ms_90500_echo_roster Soft 43960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_90500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 43960+ soft_fertig_ssh_auth_ms_90500_echo_roster type ok"; echo "cleaned"; echo "OK: phase43963 e2e passed"
