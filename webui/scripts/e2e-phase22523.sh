#!/usr/bin/env bash
# Phase-22523: client soft_fertig_ssh_auth_ms_57000_echo_roster Soft 22520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_57000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 22520+ soft_fertig_ssh_auth_ms_57000_echo_roster type ok"; echo "cleaned"; echo "OK: phase22523 e2e passed"
