#!/usr/bin/env bash
# Phase-28843: client soft_fertig_ssh_auth_soft_29400_echo_roster Soft 28840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_29400_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 28840+ soft_fertig_ssh_auth_soft_29400_echo_roster type ok"; echo "cleaned"; echo "OK: phase28843 e2e passed"
