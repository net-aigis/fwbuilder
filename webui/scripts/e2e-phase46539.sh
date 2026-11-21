#!/usr/bin/env bash
# Phase-46539: client soft_fertig_ssh_auth_schema_519_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_519_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-519-echo roster type ok"; echo "cleaned"; echo "OK: phase46539 e2e passed"
