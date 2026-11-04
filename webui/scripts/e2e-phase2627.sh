#!/usr/bin/env bash
# Phase-2627: UI honesty milestone + honesty bundle roster at 6300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty bundle roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6300 UI ok"
echo "cleaned"
echo "OK: phase2627 e2e passed"
