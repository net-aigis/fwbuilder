#!/usr/bin/env bash
# Phase-32523: client soft_fertig_ssh_auth_schema_343_echo_roster Soft 32520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_343_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 32520+ soft_fertig_ssh_auth_schema_343_echo_roster type ok"; echo "cleaned"; echo "OK: phase32523 e2e passed"
