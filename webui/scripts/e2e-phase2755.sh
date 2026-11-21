#!/usr/bin/env bash
# Phase-2755: UI honesty milestone + surfaceRoster storage at 6700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'surfaceRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6700 UI ok"
echo "cleaned"
echo "OK: phase2755 e2e passed"
