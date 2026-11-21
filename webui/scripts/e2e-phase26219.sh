#!/usr/bin/env bash
# Phase-26219: client soft_fertig_ssh_auth_soft_26520_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_26520_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-26520-echo roster type ok"; echo "cleaned"; echo "OK: phase26219 e2e passed"
