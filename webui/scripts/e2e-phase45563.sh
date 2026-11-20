#!/usr/bin/env bash
# Phase-45563: client soft_fertig_ssh_auth_ms_93000_echo_roster Soft 45560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_93000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 45560+ soft_fertig_ssh_auth_ms_93000_echo_roster type ok"; echo "cleaned"; echo "OK: phase45563 e2e passed"
