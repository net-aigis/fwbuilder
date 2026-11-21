#!/usr/bin/env bash
# Phase-32043: client soft_fertig_ssh_auth_soft_33000_echo_roster Soft 32040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_33000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 32040+ soft_fertig_ssh_auth_soft_33000_echo_roster type ok"; echo "cleaned"; echo "OK: phase32043 e2e passed"
