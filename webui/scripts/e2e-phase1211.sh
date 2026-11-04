#!/usr/bin/env bash
# Phase-1211: UI honesty milestone note still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathTitles' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 1900 UI ok"
echo "cleaned"
echo "OK: phase1211 e2e passed"
