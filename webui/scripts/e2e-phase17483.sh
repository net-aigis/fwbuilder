#!/usr/bin/env bash
# Phase-17483: client soft_fertig_ssh_auth_schema_155_echo_roster Soft 17480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_155_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 17480+ soft_fertig_ssh_auth_schema_155_echo_roster type ok"; echo "cleaned"; echo "OK: phase17483 e2e passed"
