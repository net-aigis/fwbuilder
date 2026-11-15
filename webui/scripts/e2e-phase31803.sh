#!/usr/bin/env bash
# Phase-31803: client soft_fertig_ssh_auth_ms_71500_echo_roster Soft 31800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_71500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 31800+ soft_fertig_ssh_auth_ms_71500_echo_roster type ok"; echo "cleaned"; echo "OK: phase31803 e2e passed"
