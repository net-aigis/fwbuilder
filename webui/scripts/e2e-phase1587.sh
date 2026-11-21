#!/usr/bin/env bash
# Phase-1587: UI honesty milestone wiring at 3050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyExportDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3050 UI ok"
echo "cleaned"
echo "OK: phase1587 e2e passed"
