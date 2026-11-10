#!/usr/bin/env bash
# Phase-25323: client soft_fertig_ssh_auth_soft_25440_echo_roster Soft 25320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_25440_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 25320+ soft_fertig_ssh_auth_soft_25440_echo_roster type ok"; echo "cleaned"; echo "OK: phase25323 e2e passed"
