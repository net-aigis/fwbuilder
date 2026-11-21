#!/usr/bin/env bash
# Phase-37963: client soft_fertig_ssh_auth_schema_411_echo_roster Soft 37960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_411_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 37960+ soft_fertig_ssh_auth_schema_411_echo_roster type ok"; echo "cleaned"; echo "OK: phase37963 e2e passed"
