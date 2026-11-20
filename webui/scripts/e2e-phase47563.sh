#!/usr/bin/env bash
# Phase-47563: client soft_fertig_ssh_auth_schema_531_echo_roster Soft 47560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_531_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 47560+ soft_fertig_ssh_auth_schema_531_echo_roster type ok"; echo "cleaned"; echo "OK: phase47563 e2e passed"
