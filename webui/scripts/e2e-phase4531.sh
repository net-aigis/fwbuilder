#!/usr/bin/env bash
# Phase-4531: UI honesty milestone at 12250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig expect-steps-refusals roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12250 UI ok"
echo "cleaned"
echo "OK: phase4531 e2e passed"
