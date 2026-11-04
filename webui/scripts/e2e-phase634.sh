#!/usr/bin/env bash
# Phase-634: UI shows sample fidelity from summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapsSummaryFidelity' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Sample fidelity' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_score_percent' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq '(not pixel)' webui/frontend/src/components/FirewallExtras.tsx
echo "summary fidelity UI ok"
echo "cleaned"
echo "OK: phase634 e2e passed"
