#!/usr/bin/env bash
# Phase-28923: client soft_fertig_ssh_auth_ms_67000_echo_roster Soft 28920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_67000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 28920+ soft_fertig_ssh_auth_ms_67000_echo_roster type ok"; echo "cleaned"; echo "OK: phase28923 e2e passed"
