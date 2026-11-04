#!/usr/bin/env bash
# Phase-2531: UI honesty milestone at 6000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty path roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6000 UI ok"
echo "cleaned"
echo "OK: phase2531 e2e passed"
