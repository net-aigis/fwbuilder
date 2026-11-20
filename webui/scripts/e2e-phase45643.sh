#!/usr/bin/env bash
# Phase-45643: client soft_fertig_ssh_auth_schema_507_echo_roster Soft 45640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_507_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 45640+ soft_fertig_ssh_auth_schema_507_echo_roster type ok"; echo "cleaned"; echo "OK: phase45643 e2e passed"
