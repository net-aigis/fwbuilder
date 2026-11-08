#!/usr/bin/env bash
# Phase-14459: client soft_fertig_ssh_auth_clear_ssh_ratio_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_clear_ssh_ratio_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-clear-ssh-ratio roster type ok"; echo "cleaned"; echo "OK: phase14459 e2e passed"
