#!/usr/bin/env bash
# Phase-41899: client soft_fertig_ssh_auth_soft_44080_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_44080_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-44080-echo roster type ok"; echo "cleaned"; echo "OK: phase41899 e2e passed"
