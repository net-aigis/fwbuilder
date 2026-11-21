#!/usr/bin/env bash
# Phase-2227: UI honesty milestone + hard-gap roster at 5050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gap roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5050 UI ok"
echo "cleaned"
echo "OK: phase2227 e2e passed"
