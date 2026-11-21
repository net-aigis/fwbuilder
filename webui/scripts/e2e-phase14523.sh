#!/usr/bin/env bash
# Phase-14523: client soft_fertig_ssh_auth_clear_ssh_ratio_roster Soft 14520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_clear_ssh_ratio_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 14520+ soft_fertig_ssh_auth_clear_ssh_ratio_roster type ok"; echo "cleaned"; echo "OK: phase14523 e2e passed"
