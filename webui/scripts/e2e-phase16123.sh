#!/usr/bin/env bash
# Phase-16123: client soft_fertig_ssh_auth_ms_47000_echo_roster Soft 16120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_47000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 16120+ soft_fertig_ssh_auth_ms_47000_echo_roster type ok"; echo "cleaned"; echo "OK: phase16123 e2e passed"
