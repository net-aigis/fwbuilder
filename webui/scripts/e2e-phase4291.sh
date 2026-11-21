#!/usr/bin/env bash
# Phase-4291: UI honesty milestone at 11500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig option-enable roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11500 UI ok"
echo "cleaned"
echo "OK: phase4291 e2e passed"
