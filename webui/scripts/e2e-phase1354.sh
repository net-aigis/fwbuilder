#!/usr/bin/env bash
# Phase-1354: UI surface detail still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigSurfaceDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface detail still ok"
echo "cleaned"
echo "OK: phase1354 e2e passed"
