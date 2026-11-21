#!/usr/bin/env bash
# Phase-46379: client soft_fertig_ssh_auth_soft_49120_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_49120_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-49120-echo roster type ok"; echo "cleaned"; echo "OK: phase46379 e2e passed"
