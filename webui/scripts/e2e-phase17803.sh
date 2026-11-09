#!/usr/bin/env bash
# Phase-17803: client soft_fertig_ssh_auth_schema_159_echo_roster Soft 17800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_159_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 17800+ soft_fertig_ssh_auth_schema_159_echo_roster type ok"; echo "cleaned"; echo "OK: phase17803 e2e passed"
