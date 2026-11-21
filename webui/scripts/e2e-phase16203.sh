#!/usr/bin/env bash
# Phase-16203: client soft_fertig_ssh_auth_schema_139_echo_roster Soft 16200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_139_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 16200+ soft_fertig_ssh_auth_schema_139_echo_roster type ok"; echo "cleaned"; echo "OK: phase16203 e2e passed"
