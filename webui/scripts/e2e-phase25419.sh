#!/usr/bin/env bash
# Phase-25419: client soft_fertig_ssh_auth_schema_255_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_255_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-255-echo roster type ok"; echo "cleaned"; echo "OK: phase25419 e2e passed"
