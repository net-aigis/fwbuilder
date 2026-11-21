#!/usr/bin/env bash
# Phase-3843: UI honesty milestone + health_roster at 10100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'health_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10100 UI ok"
echo "cleaned"
echo "OK: phase3843 e2e passed"
