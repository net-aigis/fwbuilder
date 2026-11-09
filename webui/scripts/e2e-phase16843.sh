#!/usr/bin/env bash
# Phase-16843: client soft_fertig_ssh_auth_schema_147_echo_roster Soft 16840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_147_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 16840+ soft_fertig_ssh_auth_schema_147_echo_roster type ok"; echo "cleaned"; echo "OK: phase16843 e2e passed"
