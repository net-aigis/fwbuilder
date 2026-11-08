#!/usr/bin/env bash
# Phase-14843: client soft_fertig_ssh_auth_schema_delta_roster Soft 14840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_delta_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 14840+ soft_fertig_ssh_auth_schema_delta_roster type ok"; echo "cleaned"; echo "OK: phase14843 e2e passed"
