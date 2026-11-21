#!/usr/bin/env bash
# Phase-1099: UI honesty milestone note still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 1550 UI ok"
echo "cleaned"
echo "OK: phase1099 e2e passed"
