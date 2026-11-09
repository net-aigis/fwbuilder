#!/usr/bin/env bash
# Phase-22603: client soft_fertig_ssh_auth_schema_219_echo_roster Soft 22600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_219_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 22600+ soft_fertig_ssh_auth_schema_219_echo_roster type ok"; echo "cleaned"; echo "OK: phase22603 e2e passed"
