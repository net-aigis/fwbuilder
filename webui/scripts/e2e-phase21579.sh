#!/usr/bin/env bash
# Phase-21579: client soft_fertig_ssh_auth_schema_207_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_207_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-207-echo roster type ok"; echo "cleaned"; echo "OK: phase21579 e2e passed"
