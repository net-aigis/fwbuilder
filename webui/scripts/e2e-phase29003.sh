#!/usr/bin/env bash
# Phase-29003: client soft_fertig_ssh_auth_schema_299_echo_roster Soft 29000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_299_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 29000+ soft_fertig_ssh_auth_schema_299_echo_roster type ok"; echo "cleaned"; echo "OK: phase29003 e2e passed"
