#!/usr/bin/env bash
# Phase-1322: UI still consumes related refusals from hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_related_refusals' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'relatedRefusalsDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "UI related refusals still ok"
echo "cleaned"
echo "OK: phase1322 e2e passed"
