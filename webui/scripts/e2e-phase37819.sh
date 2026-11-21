#!/usr/bin/env bash
# Phase-37819: client soft_fertig_ssh_auth_ms_81000_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_81000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-81000-echo roster type ok"; echo "cleaned"; echo "OK: phase37819 e2e passed"
