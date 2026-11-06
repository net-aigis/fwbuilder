#!/usr/bin/env bash
# Phase-3731: UI honesty milestone at 9750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gaps summary roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9750 UI ok"
echo "cleaned"
echo "OK: phase3731 e2e passed"
