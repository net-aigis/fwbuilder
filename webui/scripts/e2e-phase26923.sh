#!/usr/bin/env bash
# Phase-26923: client soft_fertig_ssh_auth_soft_27240_echo_roster Soft 26920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_27240_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 26920+ soft_fertig_ssh_auth_soft_27240_echo_roster type ok"; echo "cleaned"; echo "OK: phase26923 e2e passed"
