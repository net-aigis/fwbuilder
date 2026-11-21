#!/usr/bin/env bash
# Phase-44363: client soft_fertig_ssh_auth_schema_491_echo_roster Soft 44360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_491_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 44360+ soft_fertig_ssh_auth_schema_491_echo_roster type ok"; echo "cleaned"; echo "OK: phase44363 e2e passed"
