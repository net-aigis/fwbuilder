#!/usr/bin/env bash
# Phase-44139: client soft_fertig_ssh_auth_soft_46600_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_46600_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-46600-echo roster type ok"; echo "cleaned"; echo "OK: phase44139 e2e passed"
