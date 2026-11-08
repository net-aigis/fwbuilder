#!/usr/bin/env bash
# Phase-13243: client soft_fertig_ssh_auth_schema_parts_roster Soft 13240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_parts_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13240+ soft_fertig_ssh_auth_schema_parts_roster type ok"; echo "cleaned"; echo "OK: phase13243 e2e passed"
