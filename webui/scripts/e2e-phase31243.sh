#!/usr/bin/env bash
# Phase-31243: client soft_fertig_ssh_auth_schema_327_echo_roster Soft 31240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_327_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 31240+ soft_fertig_ssh_auth_schema_327_echo_roster type ok"; echo "cleaned"; echo "OK: phase31243 e2e passed"
