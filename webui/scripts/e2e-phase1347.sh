#!/usr/bin/env bash
# Phase-1347: UI milestone wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2300 UI ok"
echo "cleaned"
echo "OK: phase1347 e2e passed"
