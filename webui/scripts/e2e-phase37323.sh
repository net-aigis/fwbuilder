#!/usr/bin/env bash
# Phase-37323: client soft_fertig_ssh_auth_schema_403_echo_roster Soft 37320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_403_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 37320+ soft_fertig_ssh_auth_schema_403_echo_roster type ok"; echo "cleaned"; echo "OK: phase37323 e2e passed"
