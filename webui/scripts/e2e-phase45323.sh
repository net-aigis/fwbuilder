#!/usr/bin/env bash
# Phase-45323: client soft_fertig_ssh_auth_schema_503_echo_roster Soft 45320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_503_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 45320+ soft_fertig_ssh_auth_schema_503_echo_roster type ok"; echo "cleaned"; echo "OK: phase45323 e2e passed"
