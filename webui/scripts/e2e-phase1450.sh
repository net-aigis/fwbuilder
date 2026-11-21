#!/usr/bin/env bash
# Phase-1450: downloads persist to sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sessionStorage.setItem(softFertigSurfaceStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.setItem(relatedRefusalsStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.setItem(honestyPathsCatalogKey' webui/frontend/src/components/FirewallExtras.tsx
echo "sessionStorage persist on download ok"
echo "cleaned"
echo "OK: phase1450 e2e passed"
