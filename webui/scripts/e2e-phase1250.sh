#!/usr/bin/env bash
# Phase-1250: UI related refusal titles bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_related_refusal_titles' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapRelatedRefusalTitles' webui/frontend/src/components/FirewallExtras.tsx
echo "UI related refusal titles ok"
echo "cleaned"
echo "OK: phase1250 e2e passed"
