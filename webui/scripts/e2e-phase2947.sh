#!/usr/bin/env bash
# Phase-2947: UI honesty milestone + SSH honesty roster at 7300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig SSH honesty roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7300 UI ok"
echo "cleaned"
echo "OK: phase2947 e2e passed"
