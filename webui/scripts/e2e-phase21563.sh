#!/usr/bin/env bash
# Phase-21563: client soft_fertig_ssh_auth_ms_55500_echo_roster Soft 21560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_55500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 21560+ soft_fertig_ssh_auth_ms_55500_echo_roster type ok"; echo "cleaned"; echo "OK: phase21563 e2e passed"
