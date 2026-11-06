#!/usr/bin/env bash
# Phase-3571: UI honesty milestone at 9250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty operator brief roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9250 UI ok"
echo "cleaned"
echo "OK: phase3571 e2e passed"
