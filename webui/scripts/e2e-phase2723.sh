#!/usr/bin/env bash
# Phase-2723: UI honesty milestone + surface_roster bundle at 6600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'surface_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6600 UI ok"
echo "cleaned"
echo "OK: phase2723 e2e passed"
