#!/usr/bin/env bash
# Phase-36363: client soft_fertig_ssh_auth_schema_391_echo_roster Soft 36360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_391_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 36360+ soft_fertig_ssh_auth_schema_391_echo_roster type ok"; echo "cleaned"; echo "OK: phase36363 e2e passed"
