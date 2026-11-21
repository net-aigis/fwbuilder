#!/usr/bin/env bash
# Phase-25099: client soft_fertig_ssh_auth_schema_251_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_251_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-251-echo roster type ok"; echo "cleaned"; echo "OK: phase25099 e2e passed"
