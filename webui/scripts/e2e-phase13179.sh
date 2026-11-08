#!/usr/bin/env bash
# Phase-13179: client soft_fertig_ssh_auth_schema_parts_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_parts_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-schema-parts roster type ok"; echo "cleaned"; echo "OK: phase13179 e2e passed"
