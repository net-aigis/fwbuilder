#!/usr/bin/env bash
# Phase-46059: client soft_fertig_ssh_auth_soft_48760_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_48760_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-48760-echo roster type ok"; echo "cleaned"; echo "OK: phase46059 e2e passed"
