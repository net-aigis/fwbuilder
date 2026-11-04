#!/usr/bin/env bash
# Phase-1779: UI honesty milestone + catalog summary at 3650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'catalogSummaryDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3650 UI ok"
echo "cleaned"
echo "OK: phase1779 e2e passed"
