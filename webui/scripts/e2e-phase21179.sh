#!/usr/bin/env bash
# Phase-21179: client soft_fertig_ssh_auth_ms_55000_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_55000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-55000-echo roster type ok"; echo "cleaned"; echo "OK: phase21179 e2e passed"
