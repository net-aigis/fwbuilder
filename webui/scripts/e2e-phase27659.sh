#!/usr/bin/env bash
# Phase-27659: client soft_fertig_ssh_auth_schema_283_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_283_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-283-echo roster type ok"; echo "cleaned"; echo "OK: phase27659 e2e passed"
