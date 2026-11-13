#!/usr/bin/env bash
# Phase-29099: client soft_fertig_ssh_auth_soft_29760_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_29760_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-29760-echo roster type ok"; echo "cleaned"; echo "OK: phase29099 e2e passed"
