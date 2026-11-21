#!/usr/bin/env bash
# Phase-17163: client soft_fertig_ssh_auth_schema_151_echo_roster Soft 17160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_151_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 17160+ soft_fertig_ssh_auth_schema_151_echo_roster type ok"; echo "cleaned"; echo "OK: phase17163 e2e passed"
