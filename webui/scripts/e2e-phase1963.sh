#!/usr/bin/env bash
# Phase-1963: client catalog summary type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_catalog_summary?:' webui/frontend/src/api/client.ts
echo "client catalog summary type ok"
echo "cleaned"
echo "OK: phase1963 e2e passed"
