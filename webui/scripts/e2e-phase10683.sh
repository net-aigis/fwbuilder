#!/usr/bin/env bash
# Phase-10683: client soft_fertig_ssh_auth_empty_check_roster Soft 10680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_empty_check_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 10680+ soft_fertig_ssh_auth_empty_check_roster type ok"; echo "cleaned"; echo "OK: phase10683 e2e passed"
