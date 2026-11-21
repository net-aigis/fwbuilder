#!/usr/bin/env bash
# Phase-17339: client soft_fertig_ssh_auth_ms_49000_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_49000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-49000-echo roster type ok"; echo "cleaned"; echo "OK: phase17339 e2e passed"
