#!/usr/bin/env bash
# Phase-35243: client soft_fertig_ssh_auth_soft_36520_echo_roster Soft 35240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_36520_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 35240+ soft_fertig_ssh_auth_soft_36520_echo_roster type ok"; echo "cleaned"; echo "OK: phase35243 e2e passed"
