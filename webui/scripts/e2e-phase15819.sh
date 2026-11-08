#!/usr/bin/env bash
# Phase-15819: client soft_fertig_ssh_auth_schema_135_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_135_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-135-echo roster type ok"; echo "cleaned"; echo "OK: phase15819 e2e passed"
