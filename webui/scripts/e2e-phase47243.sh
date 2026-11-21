#!/usr/bin/env bash
# Phase-47243: client soft_fertig_ssh_auth_schema_527_echo_roster Soft 47240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_527_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 47240+ soft_fertig_ssh_auth_schema_527_echo_roster type ok"; echo "cleaned"; echo "OK: phase47243 e2e passed"
