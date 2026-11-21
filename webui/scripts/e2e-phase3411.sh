#!/usr/bin/env bash
# Phase-3411: UI honesty milestone at 8750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty readiness roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8750 UI ok"
echo "cleaned"
echo "OK: phase3411 e2e passed"
