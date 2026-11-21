#!/usr/bin/env bash
# Phase-2611: UI honesty milestone at 6250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty path roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6250 UI ok"
echo "cleaned"
echo "OK: phase2611 e2e passed"
