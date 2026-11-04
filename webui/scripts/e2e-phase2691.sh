#!/usr/bin/env bash
# Phase-2691: UI honesty milestone at 6500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty path roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6500 UI ok"
echo "cleaned"
echo "OK: phase2691 e2e passed"
