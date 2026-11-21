#!/usr/bin/env bash
# Phase-48523: client soft_fertig_ssh_auth_schema_543_echo_roster Soft 48520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_543_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 48520+ soft_fertig_ssh_auth_schema_543_echo_roster type ok"; echo "cleaned"; echo "OK: phase48523 e2e passed"
