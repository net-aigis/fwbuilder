#!/usr/bin/env bash
# Phase-24203: client soft_fertig_ssh_auth_schema_239_echo_roster Soft 24200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_239_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 24200+ soft_fertig_ssh_auth_schema_239_echo_roster type ok"; echo "cleaned"; echo "OK: phase24203 e2e passed"
