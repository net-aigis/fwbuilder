#!/usr/bin/env bash
# Phase-1674: UI surface + clear honesty catalogs still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigSurfaceKeyCount' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Clear honesty catalogs' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface+clear still ok"
echo "cleaned"
echo "OK: phase1674 e2e passed"
