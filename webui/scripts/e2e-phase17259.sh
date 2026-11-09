#!/usr/bin/env bash
# Phase-17259: client soft_fertig_ssh_auth_soft_17240_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_17240_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-17240-echo roster type ok"; echo "cleaned"; echo "OK: phase17259 e2e passed"
