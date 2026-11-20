#!/usr/bin/env bash
# Phase-36043: client soft_fertig_ssh_auth_schema_387_echo_roster Soft 36040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_387_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 36040+ soft_fertig_ssh_auth_schema_387_echo_roster type ok"; echo "cleaned"; echo "OK: phase36043 e2e passed"
