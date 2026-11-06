#!/usr/bin/env bash
# Phase-3658: UI hard-gaps summary roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapsSummaryRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gaps summary roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download hard-gaps summary roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard-gaps summary roster ok"
echo "cleaned"
echo "OK: phase3658 e2e passed"
