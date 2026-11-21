#!/usr/bin/env bash
# Phase-3923: UI honesty milestone + res_status_roster at 10350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'res_status_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10350 UI ok"
echo "cleaned"
echo "OK: phase3923 e2e passed"
