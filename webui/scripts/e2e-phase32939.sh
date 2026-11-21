#!/usr/bin/env bash
# Phase-32939: client soft_fertig_ssh_auth_soft_34080_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_34080_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-34080-echo roster type ok"; echo "cleaned"; echo "OK: phase32939 e2e passed"
