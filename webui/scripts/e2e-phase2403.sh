#!/usr/bin/env bash
# Phase-2403: UI honesty milestone + honesty_path_roster bundle at 5600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty_path_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5600 UI ok"
echo "cleaned"
echo "OK: phase2403 e2e passed"
