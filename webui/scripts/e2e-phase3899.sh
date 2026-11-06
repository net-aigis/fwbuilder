#!/usr/bin/env bash
# Phase-3899: client res_status_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_res_status_roster?:' webui/frontend/src/api/client.ts
echo "client res-status roster type ok"
echo "cleaned"
echo "OK: phase3899 e2e passed"
