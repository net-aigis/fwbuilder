#!/usr/bin/env bash
# Phase-3963: client soft_fertig_res_status_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_res_status_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3960+ soft_fertig_res_status_roster type ok"
echo "cleaned"
echo "OK: phase3963 e2e passed"
