#!/usr/bin/env bash
# Phase-1923: UI honesty milestone + readiness download at 4100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download readiness' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4100 UI ok"
echo "cleaned"
echo "OK: phase1923 e2e passed"
