#!/usr/bin/env bash
# Phase-1274: UI surface keys state wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'setSoftFertigSurfaceKeys' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'setSoftFertigSurfaceDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface detail wiring ok"
echo "cleaned"
echo "OK: phase1274 e2e passed"
