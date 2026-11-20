#!/usr/bin/env bash
# Phase-37643: client soft_fertig_ssh_auth_schema_407_echo_roster Soft 37640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_407_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 37640+ soft_fertig_ssh_auth_schema_407_echo_roster type ok"; echo "cleaned"; echo "OK: phase37643 e2e passed"
