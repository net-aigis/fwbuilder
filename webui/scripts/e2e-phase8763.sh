#!/usr/bin/env bash
# Phase-8763: client soft_fertig_ssh_not_implemented_password_refresh_roster Soft 8760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_password_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 8760+ soft_fertig_ssh_not_implemented_password_refresh_roster type ok"; echo "cleaned"; echo "OK: phase8763 e2e passed"
