#!/usr/bin/env bash
# Phase-1771: client catalog summary type still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_catalog_summary?:' webui/frontend/src/api/client.ts
echo "client catalog summary type ok"
echo "cleaned"
echo "OK: phase1771 e2e passed"
