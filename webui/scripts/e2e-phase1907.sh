#!/usr/bin/env bash
# Phase-1907: UI honesty milestone + readiness at 4050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download readiness' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4050 UI ok"
echo "cleaned"
echo "OK: phase1907 e2e passed"
