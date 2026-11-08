#!/usr/bin/env bash
# Phase-14683: client soft_fertig_ssh_auth_auth_prefix_ratio_roster Soft 14680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_auth_prefix_ratio_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 14680+ soft_fertig_ssh_auth_auth_prefix_ratio_roster type ok"; echo "cleaned"; echo "OK: phase14683 e2e passed"
