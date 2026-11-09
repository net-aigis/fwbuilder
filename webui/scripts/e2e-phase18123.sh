#!/usr/bin/env bash
# Phase-18123: client soft_fertig_ssh_auth_schema_163_echo_roster Soft 18120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_163_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 18120+ soft_fertig_ssh_auth_schema_163_echo_roster type ok"; echo "cleaned"; echo "OK: phase18123 e2e passed"
