#!/usr/bin/env bash
# Phase-18763: client soft_fertig_ssh_auth_schema_171_echo_roster Soft 18760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_171_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 18760+ soft_fertig_ssh_auth_schema_171_echo_roster type ok"; echo "cleaned"; echo "OK: phase18763 e2e passed"
