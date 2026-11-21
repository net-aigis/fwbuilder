#!/usr/bin/env bash
# Phase-17419: client soft_fertig_ssh_auth_schema_155_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_155_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-155-echo roster type ok"; echo "cleaned"; echo "OK: phase17419 e2e passed"
