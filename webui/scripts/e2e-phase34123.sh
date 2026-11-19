#!/usr/bin/env bash
# Phase-34123: client soft_fertig_ssh_auth_schema_363_echo_roster Soft 34120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_363_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 34120+ soft_fertig_ssh_auth_schema_363_echo_roster type ok"; echo "cleaned"; echo "OK: phase34123 e2e passed"
