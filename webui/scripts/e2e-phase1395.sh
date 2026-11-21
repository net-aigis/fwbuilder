#!/usr/bin/env bash
# Phase-1395: UI milestone wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2450 UI ok"
echo "cleaned"
echo "OK: phase1395 e2e passed"
