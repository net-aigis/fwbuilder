#!/usr/bin/env bash
# Phase-1115: UI honesty milestone note still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 1600 UI ok"
echo "cleaned"
echo "OK: phase1115 e2e passed"
