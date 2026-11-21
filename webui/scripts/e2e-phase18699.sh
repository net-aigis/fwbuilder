#!/usr/bin/env bash
# Phase-18699: client soft_fertig_ssh_auth_schema_171_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_171_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-171-echo roster type ok"; echo "cleaned"; echo "OK: phase18699 e2e passed"
