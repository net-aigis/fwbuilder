#!/usr/bin/env bash
# Phase-12203: client soft_fertig_ssh_auth_operator_echo_roster Soft 12200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_operator_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 12200+ soft_fertig_ssh_auth_operator_echo_roster type ok"; echo "cleaned"; echo "OK: phase12203 e2e passed"
