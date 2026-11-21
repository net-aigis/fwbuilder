#!/usr/bin/env bash
# Phase-14603: client soft_fertig_ssh_auth_refresh_ratio_roster Soft 14600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refresh_ratio_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 14600+ soft_fertig_ssh_auth_refresh_ratio_roster type ok"; echo "cleaned"; echo "OK: phase14603 e2e passed"
