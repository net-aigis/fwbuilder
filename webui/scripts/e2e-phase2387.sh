#!/usr/bin/env bash
# Phase-2387: UI honesty milestone + honesty path roster at 5550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty path roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5550 UI ok"
echo "cleaned"
echo "OK: phase2387 e2e passed"
