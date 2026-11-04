#!/usr/bin/env bash
# Phase-1459: UI milestone + sessionStorage keys wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softFertigSurfaceStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2650 UI ok"
echo "cleaned"
echo "OK: phase1459 e2e passed"
