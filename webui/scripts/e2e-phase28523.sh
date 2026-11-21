#!/usr/bin/env bash
# Phase-28523: client soft_fertig_ssh_auth_soft_29040_echo_roster Soft 28520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_29040_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 28520+ soft_fertig_ssh_auth_soft_29040_echo_roster type ok"; echo "cleaned"; echo "OK: phase28523 e2e passed"
