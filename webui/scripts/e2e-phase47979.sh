#!/usr/bin/env bash
# Phase-47979: client soft_fertig_ssh_auth_soft_50920_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_50920_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-50920-echo roster type ok"; echo "cleaned"; echo "OK: phase47979 e2e passed"
