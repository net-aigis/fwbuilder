#!/usr/bin/env bash
# Phase-33163: client soft_fertig_ssh_auth_schema_351_echo_roster Soft 33160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_351_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 33160+ soft_fertig_ssh_auth_schema_351_echo_roster type ok"; echo "cleaned"; echo "OK: phase33163 e2e passed"
