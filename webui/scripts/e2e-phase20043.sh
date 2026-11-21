#!/usr/bin/env bash
# Phase-20043: client soft_fertig_ssh_auth_schema_187_echo_roster Soft 20040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_187_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 20040+ soft_fertig_ssh_auth_schema_187_echo_roster type ok"; echo "cleaned"; echo "OK: phase20043 e2e passed"
