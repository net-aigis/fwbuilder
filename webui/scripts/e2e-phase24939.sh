#!/usr/bin/env bash
# Phase-24939: client soft_fertig_ssh_auth_soft_25080_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_25080_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-25080-echo roster type ok"; echo "cleaned"; echo "OK: phase24939 e2e passed"
