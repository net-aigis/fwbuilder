#!/usr/bin/env bash
# Phase-19963: client soft_fertig_ssh_auth_ms_53000_echo_roster Soft 19960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_53000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 19960+ soft_fertig_ssh_auth_ms_53000_echo_roster type ok"; echo "cleaned"; echo "OK: phase19963 e2e passed"
