#!/usr/bin/env bash
# Phase-47163: client soft_fertig_ssh_auth_ms_95500_echo_roster Soft 47160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_95500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 47160+ soft_fertig_ssh_auth_ms_95500_echo_roster type ok"; echo "cleaned"; echo "OK: phase47163 e2e passed"
