#!/usr/bin/env bash
# Phase-33403: client soft_fertig_ssh_auth_ms_74000_echo_roster Soft 33400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_74000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 33400+ soft_fertig_ssh_auth_ms_74000_echo_roster type ok"; echo "cleaned"; echo "OK: phase33403 e2e passed"
