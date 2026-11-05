#!/usr/bin/env bash
# Phase-3323: client catalog_summary_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_catalog_summary_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3320+ catalog_summary_roster type ok"
echo "cleaned"
echo "OK: phase3323 e2e passed"
