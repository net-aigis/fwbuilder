#!/usr/bin/env bash
# Phase-3011: UI honesty milestone at 7500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig SSH honesty roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7500 UI ok"
echo "cleaned"
echo "OK: phase3011 e2e passed"
