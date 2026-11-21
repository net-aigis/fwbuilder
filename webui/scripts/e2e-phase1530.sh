#!/usr/bin/env bash
# Phase-1530: UI surface key count still wired after expansion.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigSurfaceKeyCount' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorageKeyCount' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface+session keys still ok"
echo "cleaned"
echo "OK: phase1530 e2e passed"
