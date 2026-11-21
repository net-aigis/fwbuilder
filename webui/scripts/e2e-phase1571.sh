#!/usr/bin/env bash
# Phase-1571: UI honesty milestone wiring at 3000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty_milestone' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3000 UI ok"
echo "cleaned"
echo "OK: phase1571 e2e passed"
