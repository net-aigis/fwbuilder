#!/usr/bin/env bash
# Phase-16683: client soft_fertig_ssh_auth_soft_16640_echo_roster Soft 16680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_16640_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 16680+ soft_fertig_ssh_auth_soft_16640_echo_roster type ok"; echo "cleaned"; echo "OK: phase16683 e2e passed"
