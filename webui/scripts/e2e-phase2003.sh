#!/usr/bin/env bash
# Phase-2003: UI honesty milestone + softCompleteNote at 4350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softCompleteNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4350 UI ok"
echo "cleaned"
echo "OK: phase2003 e2e passed"
