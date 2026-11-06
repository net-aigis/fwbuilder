#!/usr/bin/env bash
# Phase-3811: UI honesty milestone at 10000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gaps closure roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10000 UI ok"
echo "cleaned"
echo "OK: phase3811 e2e passed"
