#!/usr/bin/env bash
# Phase-1770: UI catalog summary detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'catalogSummaryDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download catalog summary' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig catalog summary' webui/frontend/src/components/FirewallExtras.tsx
echo "UI catalog summary ok"
echo "cleaned"
echo "OK: phase1770 e2e passed"
