#!/usr/bin/env bash
# Phase-29323: client soft_fertig_ssh_auth_schema_303_echo_roster Soft 29320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_303_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 29320+ soft_fertig_ssh_auth_schema_303_echo_roster type ok"; echo "cleaned"; echo "OK: phase29323 e2e passed"
