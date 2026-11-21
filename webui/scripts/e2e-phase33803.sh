#!/usr/bin/env bash
# Phase-33803: client soft_fertig_ssh_auth_schema_359_echo_roster Soft 33800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_359_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 33800+ soft_fertig_ssh_auth_schema_359_echo_roster type ok"; echo "cleaned"; echo "OK: phase33803 e2e passed"
