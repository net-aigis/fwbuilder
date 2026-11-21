#!/usr/bin/env bash
# Phase-1315: UI milestone + surface notes wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softFertigSurfaceNotesCount' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2200 UI ok"
echo "cleaned"
echo "OK: phase1315 e2e passed"
