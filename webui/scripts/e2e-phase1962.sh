#!/usr/bin/env bash
# Phase-1962: UI catalog summary detail still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'catalogSummaryDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig catalog summary' webui/frontend/src/components/FirewallExtras.tsx
echo "UI catalog summary still ok"
echo "cleaned"
echo "OK: phase1962 e2e passed"
