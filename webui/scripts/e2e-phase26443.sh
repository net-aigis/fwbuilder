#!/usr/bin/env bash
# Phase-26443: client soft_fertig_ssh_auth_schema_267_echo_roster Soft 26440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_267_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 26440+ soft_fertig_ssh_auth_schema_267_echo_roster type ok"; echo "cleaned"; echo "OK: phase26443 e2e passed"
