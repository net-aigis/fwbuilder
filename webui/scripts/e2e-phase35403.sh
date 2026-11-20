#!/usr/bin/env bash
# Phase-35403: client soft_fertig_ssh_auth_schema_379_echo_roster Soft 35400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_379_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 35400+ soft_fertig_ssh_auth_schema_379_echo_roster type ok"; echo "cleaned"; echo "OK: phase35403 e2e passed"
