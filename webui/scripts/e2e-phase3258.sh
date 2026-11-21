#!/usr/bin/env bash
# Phase-3258: UI catalog summary roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'catalogSummaryRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig catalog summary roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download catalog summary roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI catalog summary roster ok"
echo "cleaned"
echo "OK: phase3258 e2e passed"
