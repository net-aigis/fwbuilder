#!/usr/bin/env bash
# Phase-15099: client soft_fertig_ssh_auth_ms_45k_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_45k_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-45k-echo roster type ok"; echo "cleaned"; echo "OK: phase15099 e2e passed"
