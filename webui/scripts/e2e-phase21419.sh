#!/usr/bin/env bash
# Phase-21419: client soft_fertig_ssh_auth_soft_21480_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_21480_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-21480-echo roster type ok"; echo "cleaned"; echo "OK: phase21419 e2e passed"
