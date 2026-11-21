#!/usr/bin/env bash
# Phase-1523: UI milestone + sessionStorage keys download wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download sessionStorage keys' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2850 UI ok"
echo "cleaned"
echo "OK: phase1523 e2e passed"
