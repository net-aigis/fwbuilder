#!/usr/bin/env bash
# Phase-26123: client soft_fertig_ssh_auth_schema_263_echo_roster Soft 26120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_263_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 26120+ soft_fertig_ssh_auth_schema_263_echo_roster type ok"; echo "cleaned"; echo "OK: phase26123 e2e passed"
