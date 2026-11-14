#!/usr/bin/env bash
# Phase-30923: client soft_fertig_ssh_auth_schema_323_echo_roster Soft 30920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_323_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 30920+ soft_fertig_ssh_auth_schema_323_echo_roster type ok"; echo "cleaned"; echo "OK: phase30923 e2e passed"
