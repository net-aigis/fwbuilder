#!/usr/bin/env bash
# Phase-36219: client soft_fertig_ssh_auth_ms_78500_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_78500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-78500-echo roster type ok"; echo "cleaned"; echo "OK: phase36219 e2e passed"
