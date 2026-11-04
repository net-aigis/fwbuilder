#!/usr/bin/env bash
# Phase-1690: UI clear detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sessionStorageClearDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download clear catalogs' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'clearable catalogs' webui/frontend/src/components/FirewallExtras.tsx
echo "UI clear detail/download ok"
echo "cleaned"
echo "OK: phase1690 e2e passed"
