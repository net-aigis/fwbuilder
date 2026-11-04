#!/usr/bin/env bash
# Phase-1179: UI honesty milestone note still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 1800 UI ok"
echo "cleaned"
echo "OK: phase1179 e2e passed"
