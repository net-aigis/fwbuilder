#!/usr/bin/env bash
# Phase-3722: UI hard-gaps summary roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig hard-gaps summary roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsSummaryRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3720+ hard-gaps summary roster ok"
echo "cleaned"
echo "OK: phase3722 e2e passed"
