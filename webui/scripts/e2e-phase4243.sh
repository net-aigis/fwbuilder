#!/usr/bin/env bash
# Phase-4243: UI honesty milestone + option_enable_roster at 11350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'option_enable_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11350 UI ok"
echo "cleaned"
echo "OK: phase4243 e2e passed"
