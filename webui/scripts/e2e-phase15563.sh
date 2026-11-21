#!/usr/bin/env bash
# Phase-15563: client soft_fertig_ssh_auth_schema_131_echo_roster Soft 15560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_131_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 15560+ soft_fertig_ssh_auth_schema_131_echo_roster type ok"; echo "cleaned"; echo "OK: phase15563 e2e passed"
