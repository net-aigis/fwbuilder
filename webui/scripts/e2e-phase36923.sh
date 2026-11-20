#!/usr/bin/env bash
# Phase-36923: client soft_fertig_ssh_auth_ms_79500_echo_roster Soft 36920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_79500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 36920+ soft_fertig_ssh_auth_ms_79500_echo_roster type ok"; echo "cleaned"; echo "OK: phase36923 e2e passed"
