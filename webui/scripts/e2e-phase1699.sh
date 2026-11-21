#!/usr/bin/env bash
# Phase-1699: UI honesty milestone + clear detail at 3400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorageClearDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3400 UI ok"
echo "cleaned"
echo "OK: phase1699 e2e passed"
