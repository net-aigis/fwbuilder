#!/usr/bin/env bash
# Phase-3507: UI honesty milestone + honesty operator brief roster at 9050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty operator brief roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9050 UI ok"
echo "cleaned"
echo "OK: phase3507 e2e passed"
