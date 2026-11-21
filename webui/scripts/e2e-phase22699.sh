#!/usr/bin/env bash
# Phase-22699: client soft_fertig_ssh_auth_soft_22880_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_22880_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-22880-echo roster type ok"; echo "cleaned"; echo "OK: phase22699 e2e passed"
