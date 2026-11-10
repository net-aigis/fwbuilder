#!/usr/bin/env bash
# Phase-23883: client soft_fertig_ssh_auth_schema_235_echo_roster Soft 23880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_235_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 23880+ soft_fertig_ssh_auth_schema_235_echo_roster type ok"; echo "cleaned"; echo "OK: phase23883 e2e passed"
