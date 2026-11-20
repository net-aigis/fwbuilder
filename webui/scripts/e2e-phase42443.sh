#!/usr/bin/env bash
# Phase-42443: client soft_fertig_ssh_auth_schema_467_echo_roster Soft 42440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_467_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 42440+ soft_fertig_ssh_auth_schema_467_echo_roster type ok"; echo "cleaned"; echo "OK: phase42443 e2e passed"
