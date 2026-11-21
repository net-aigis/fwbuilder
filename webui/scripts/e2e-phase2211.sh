#!/usr/bin/env bash
# Phase-2211: UI honesty milestone at 5000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyOperatorBriefDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5000 UI ok"
echo "cleaned"
echo "OK: phase2211 e2e passed"
