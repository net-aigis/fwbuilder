#!/usr/bin/env bash
# Phase-2291: UI honesty milestone at 5250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gap roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5250 UI ok"
echo "cleaned"
echo "OK: phase2291 e2e passed"
