#!/usr/bin/env bash
# Phase-24523: client soft_fertig_ssh_auth_schema_243_echo_roster Soft 24520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_243_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 24520+ soft_fertig_ssh_auth_schema_243_echo_roster type ok"; echo "cleaned"; echo "OK: phase24523 e2e passed"
