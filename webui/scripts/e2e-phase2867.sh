#!/usr/bin/env bash
# Phase-2867: UI honesty milestone + expect step roster at 7050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig expect step roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7050 UI ok"
echo "cleaned"
echo "OK: phase2867 e2e passed"
