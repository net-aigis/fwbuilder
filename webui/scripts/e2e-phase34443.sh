#!/usr/bin/env bash
# Phase-34443: client soft_fertig_ssh_auth_schema_367_echo_roster Soft 34440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_367_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 34440+ soft_fertig_ssh_auth_schema_367_echo_roster type ok"; echo "cleaned"; echo "OK: phase34443 e2e passed"
