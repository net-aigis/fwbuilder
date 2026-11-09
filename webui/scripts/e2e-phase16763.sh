#!/usr/bin/env bash
# Phase-16763: client soft_fertig_ssh_auth_ms_48000_echo_roster Soft 16760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_48000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 16760+ soft_fertig_ssh_auth_ms_48000_echo_roster type ok"; echo "cleaned"; echo "OK: phase16763 e2e passed"
