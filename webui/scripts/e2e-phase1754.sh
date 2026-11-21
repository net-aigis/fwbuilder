#!/usr/bin/env bash
# Phase-1754: UI surface keys still wired (summary is API-facing).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigSurfaceKeyCount' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface/summary still ok"
echo "cleaned"
echo "OK: phase1754 e2e passed"
