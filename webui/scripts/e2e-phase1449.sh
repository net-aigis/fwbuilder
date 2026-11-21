#!/usr/bin/env bash
# Phase-1449: sessionStorage keys for surface/refusals/honesty paths.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigSurfaceStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'relatedRefusalsStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathsCatalogKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.softFertigSurface.' webui/frontend/src/components/FirewallExtras.tsx
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1456
print("sessionStorage keys ok")
PY
echo "cleaned"
echo "OK: phase1449 e2e passed"
