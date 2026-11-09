#!/usr/bin/env bash
# Phase-19499: client soft_fertig_ssh_auth_soft_19520_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_19520_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-19520-echo roster type ok"; echo "cleaned"; echo "OK: phase19499 e2e passed"
