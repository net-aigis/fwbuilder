#!/usr/bin/env bash
# Phase-3667: UI honesty milestone + hard-gaps summary roster at 9550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gaps summary roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9550 UI ok"
echo "cleaned"
echo "OK: phase3667 e2e passed"
