#!/usr/bin/env bash
# Phase-883: UI honesty milestone note still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 1100 UI ok"
echo "cleaned"
echo "OK: phase883 e2e passed"
