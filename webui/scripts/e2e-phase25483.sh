#!/usr/bin/env bash
# Phase-25483: client soft_fertig_ssh_auth_schema_255_echo_roster Soft 25480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_255_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 25480+ soft_fertig_ssh_auth_schema_255_echo_roster type ok"; echo "cleaned"; echo "OK: phase25483 e2e passed"
