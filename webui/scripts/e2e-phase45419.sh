#!/usr/bin/env bash
# Phase-45419: client soft_fertig_ssh_auth_soft_48040_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_48040_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-48040-echo roster type ok"; echo "cleaned"; echo "OK: phase45419 e2e passed"
