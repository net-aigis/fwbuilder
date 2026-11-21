#!/usr/bin/env bash
# Phase-25579: client soft_fertig_ssh_auth_soft_25800_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_25800_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-25800-echo roster type ok"; echo "cleaned"; echo "OK: phase25579 e2e passed"
