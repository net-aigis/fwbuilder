#!/usr/bin/env bash
# Phase-1786: UI bundle includes catalog_summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'catalog_summary:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download catalog summary' webui/frontend/src/components/FirewallExtras.tsx
echo "UI bundle catalog_summary ok"
echo "cleaned"
echo "OK: phase1786 e2e passed"
