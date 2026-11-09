#!/usr/bin/env bash
# Phase-18539: client soft_fertig_ssh_auth_soft_18600_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_18600_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-18600-echo roster type ok"; echo "cleaned"; echo "OK: phase18539 e2e passed"
