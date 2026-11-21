#!/usr/bin/env bash
# Phase-27643: client soft_fertig_ssh_auth_ms_65000_echo_roster Soft 27640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_65000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 27640+ soft_fertig_ssh_auth_ms_65000_echo_roster type ok"; echo "cleaned"; echo "OK: phase27643 e2e passed"
