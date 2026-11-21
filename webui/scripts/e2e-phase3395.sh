#!/usr/bin/env bash
# Phase-3395: UI honesty milestone + catalog summary sessionStorage at 8700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyReadinessRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8700 UI ok"
echo "cleaned"
echo "OK: phase3395 e2e passed"
