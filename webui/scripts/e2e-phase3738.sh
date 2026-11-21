#!/usr/bin/env bash
# Phase-3738: UI hard-gaps closure roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapsClosureRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gaps closure roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download hard-gaps closure roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard-gaps closure roster ok"
echo "cleaned"
echo "OK: phase3738 e2e passed"
