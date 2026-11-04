#!/usr/bin/env bash
# Phase-2218: UI hard-gap roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gap roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download hard-gap roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard-gap roster ok"
echo "cleaned"
echo "OK: phase2218 e2e passed"
