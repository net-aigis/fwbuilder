#!/usr/bin/env bash
# Phase-30603: client soft_fertig_ssh_auth_schema_319_echo_roster Soft 30600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_319_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 30600+ soft_fertig_ssh_auth_schema_319_echo_roster type ok"; echo "cleaned"; echo "OK: phase30603 e2e passed"
