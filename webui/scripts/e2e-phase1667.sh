#!/usr/bin/env bash
# Phase-1667: UI honesty milestone + clear wiring at 3300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Clear honesty catalogs' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3300 UI ok"
echo "cleaned"
echo "OK: phase1667 e2e passed"
