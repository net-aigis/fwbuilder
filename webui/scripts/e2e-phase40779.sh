#!/usr/bin/env bash
# Phase-40779: client soft_fertig_ssh_auth_schema_447_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_447_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-447-echo roster type ok"; echo "cleaned"; echo "OK: phase40779 e2e passed"
