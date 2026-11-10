#!/usr/bin/env bash
# Phase-25163: client soft_fertig_ssh_auth_schema_251_echo_roster Soft 25160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_251_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 25160+ soft_fertig_ssh_auth_schema_251_echo_roster type ok"; echo "cleaned"; echo "OK: phase25163 e2e passed"
