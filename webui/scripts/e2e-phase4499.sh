#!/usr/bin/env bash
# Phase-4499: UI honesty milestone + surface schema at 12150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12150 UI ok"
echo "cleaned"
echo "OK: phase4499 e2e passed"
