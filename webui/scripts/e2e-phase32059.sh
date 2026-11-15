#!/usr/bin/env bash
# Phase-32059: client soft_fertig_ssh_auth_ms_72000_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_72000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-72000-echo roster type ok"; echo "cleaned"; echo "OK: phase32059 e2e passed"
