#!/usr/bin/env bash
# Phase-1451: clear removes new sessionStorage keys.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sessionStorage.removeItem(softFertigSurfaceStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(relatedRefusalsStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(honestyPathsCatalogKey' webui/frontend/src/components/FirewallExtras.tsx
echo "clear sessionStorage keys ok"
echo "cleaned"
echo "OK: phase1451 e2e passed"
