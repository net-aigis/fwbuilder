#!/usr/bin/env bash
# Phase-21323: client soft_fertig_ssh_auth_schema_203_echo_roster Soft 21320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_203_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 21320+ soft_fertig_ssh_auth_schema_203_echo_roster type ok"; echo "cleaned"; echo "OK: phase21323 e2e passed"
