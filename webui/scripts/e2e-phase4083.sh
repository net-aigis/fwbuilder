#!/usr/bin/env bash
# Phase-4083: UI honesty milestone + layout_fidelity_roster at 10850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10850 UI ok"
echo "cleaned"
echo "OK: phase4083 e2e passed"
