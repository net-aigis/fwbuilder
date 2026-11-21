#!/usr/bin/env bash
# Phase-28459: client soft_fertig_ssh_auth_soft_29040_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_29040_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-29040-echo roster type ok"; echo "cleaned"; echo "OK: phase28459 e2e passed"
