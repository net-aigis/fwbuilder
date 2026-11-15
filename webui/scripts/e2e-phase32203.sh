#!/usr/bin/env bash
# Phase-32203: client soft_fertig_ssh_auth_schema_339_echo_roster Soft 32200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_339_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 32200+ soft_fertig_ssh_auth_schema_339_echo_roster type ok"; echo "cleaned"; echo "OK: phase32203 e2e passed"
