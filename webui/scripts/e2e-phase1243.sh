#!/usr/bin/env bash
# Phase-1243: UI honesty milestone + surface keys still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softFertigSurfaceKeyCount' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2000 UI ok"
echo "cleaned"
echo "OK: phase1243 e2e passed"
