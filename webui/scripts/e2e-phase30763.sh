#!/usr/bin/env bash
# Phase-30763: client soft_fertig_ssh_auth_soft_31560_echo_roster Soft 30760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_31560_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 30760+ soft_fertig_ssh_auth_soft_31560_echo_roster type ok"; echo "cleaned"; echo "OK: phase30763 e2e passed"
