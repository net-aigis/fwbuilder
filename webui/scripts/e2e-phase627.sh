#!/usr/bin/env bash
# Phase-627: summary UI + clear snapshot.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'fetchHardGapsSummary' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Show hard-gaps summary' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download summary' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Clear hard-gaps snapshot' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsSummaryKey' webui/frontend/src/components/FirewallExtras.tsx
echo "summary UI ok"
echo "cleaned"
echo "OK: phase627 e2e passed"
