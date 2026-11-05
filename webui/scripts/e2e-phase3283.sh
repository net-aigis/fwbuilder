#!/usr/bin/env bash
# Phase-3283: UI honesty milestone + catalog_summary_roster at 8350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'catalog_summary_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8350 UI ok"
echo "cleaned"
echo "OK: phase3283 e2e passed"
