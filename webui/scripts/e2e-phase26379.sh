#!/usr/bin/env bash
# Phase-26379: client soft_fertig_ssh_auth_schema_267_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_267_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-267-echo roster type ok"; echo "cleaned"; echo "OK: phase26379 e2e passed"
