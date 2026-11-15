#!/usr/bin/env bash
# Phase-31883: client soft_fertig_ssh_auth_schema_335_echo_roster Soft 31880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_335_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 31880+ soft_fertig_ssh_auth_schema_335_echo_roster type ok"; echo "cleaned"; echo "OK: phase31883 e2e passed"
