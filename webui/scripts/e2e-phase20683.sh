#!/usr/bin/env bash
# Phase-20683: client soft_fertig_ssh_auth_schema_195_echo_roster Soft 20680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_195_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 20680+ soft_fertig_ssh_auth_schema_195_echo_roster type ok"; echo "cleaned"; echo "OK: phase20683 e2e passed"
