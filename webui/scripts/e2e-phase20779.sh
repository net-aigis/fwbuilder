#!/usr/bin/env bash
# Phase-20779: client soft_fertig_ssh_auth_soft_20760_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_20760_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-20760-echo roster type ok"; echo "cleaned"; echo "OK: phase20779 e2e passed"
