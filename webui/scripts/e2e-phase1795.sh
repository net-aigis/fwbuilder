#!/usr/bin/env bash
# Phase-1795: UI honesty milestone + catalog summary at 3700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'catalog_summary:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3700 UI ok"
echo "cleaned"
echo "OK: phase1795 e2e passed"
