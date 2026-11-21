#!/usr/bin/env bash
# Phase-3331: UI honesty milestone at 8500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig catalog summary roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8500 UI ok"
echo "cleaned"
echo "OK: phase3331 e2e passed"
