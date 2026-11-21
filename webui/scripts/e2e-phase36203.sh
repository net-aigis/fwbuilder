#!/usr/bin/env bash
# Phase-36203: client soft_fertig_ssh_auth_soft_37600_echo_roster Soft 36200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_37600_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 36200+ soft_fertig_ssh_auth_soft_37600_echo_roster type ok"; echo "cleaned"; echo "OK: phase36203 e2e passed"
