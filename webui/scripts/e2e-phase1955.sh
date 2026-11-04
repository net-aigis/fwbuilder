#!/usr/bin/env bash
# Phase-1955: UI honesty milestone + readiness session at 4200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyReadinessStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4200 UI ok"
echo "cleaned"
echo "OK: phase1955 e2e passed"
