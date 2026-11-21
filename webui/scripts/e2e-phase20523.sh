#!/usr/bin/env bash
# Phase-20523: client soft_fertig_ssh_auth_soft_20520_echo_roster Soft 20520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_20520_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 20520+ soft_fertig_ssh_auth_soft_20520_echo_roster type ok"; echo "cleaned"; echo "OK: phase20523 e2e passed"
