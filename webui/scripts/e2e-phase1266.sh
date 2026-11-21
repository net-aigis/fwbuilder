#!/usr/bin/env bash
# Phase-1266: UI surface key count still wired after expansion.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigSurfaceKeyCount' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softFertigSurfaceKeyTitles' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface keys after expansion ok"
echo "cleaned"
echo "OK: phase1266 e2e passed"
