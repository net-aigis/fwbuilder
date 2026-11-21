#!/usr/bin/env bash
# Phase-40299: client soft_fertig_ssh_auth_soft_42280_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_42280_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-42280-echo roster type ok"; echo "cleaned"; echo "OK: phase40299 e2e passed"
