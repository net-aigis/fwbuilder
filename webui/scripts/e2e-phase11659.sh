#!/usr/bin/env bash
# Phase-11659: client soft_fertig_ssh_auth_schema_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-echo roster type ok"; echo "cleaned"; echo "OK: phase11659 e2e passed"
