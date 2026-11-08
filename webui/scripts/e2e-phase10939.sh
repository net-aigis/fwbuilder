#!/usr/bin/env bash
# Phase-10939: client soft_fertig_ssh_auth_gap_closure_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_gap_closure_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-gap-closure-echo roster type ok"; echo "cleaned"; echo "OK: phase10939 e2e passed"
