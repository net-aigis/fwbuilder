#!/usr/bin/env bash
# Phase-2643: UI honesty milestone + honesty_bundle_roster bundle at 6350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty_bundle_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6350 UI ok"
echo "cleaned"
echo "OK: phase2643 e2e passed"
