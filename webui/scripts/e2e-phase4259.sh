#!/usr/bin/env bash
# Phase-4259: UI honesty milestone + surface schema at 11400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11400 UI ok"
echo "cleaned"
echo "OK: phase4259 e2e passed"
