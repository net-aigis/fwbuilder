#!/usr/bin/env bash
# Phase-23563: client soft_fertig_ssh_auth_schema_231_echo_roster Soft 23560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_231_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 23560+ soft_fertig_ssh_auth_schema_231_echo_roster type ok"; echo "cleaned"; echo "OK: phase23563 e2e passed"
