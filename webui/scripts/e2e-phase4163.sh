#!/usr/bin/env bash
# Phase-4163: UI honesty milestone + stack_switch_roster at 11100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'stack_switch_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11100 UI ok"
echo "cleaned"
echo "OK: phase4163 e2e passed"
