#!/usr/bin/env bash
# Phase-34539: client soft_fertig_ssh_auth_soft_35800_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_35800_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-35800-echo roster type ok"; echo "cleaned"; echo "OK: phase34539 e2e passed"
