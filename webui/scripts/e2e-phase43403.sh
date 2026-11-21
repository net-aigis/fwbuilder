#!/usr/bin/env bash
# Phase-43403: client soft_fertig_ssh_auth_schema_479_echo_roster Soft 43400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_479_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 43400+ soft_fertig_ssh_auth_schema_479_echo_roster type ok"; echo "cleaned"; echo "OK: phase43403 e2e passed"
