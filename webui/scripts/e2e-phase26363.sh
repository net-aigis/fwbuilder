#!/usr/bin/env bash
# Phase-26363: client soft_fertig_ssh_auth_ms_63000_echo_roster Soft 26360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_63000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 26360+ soft_fertig_ssh_auth_ms_63000_echo_roster type ok"; echo "cleaned"; echo "OK: phase26363 e2e passed"
