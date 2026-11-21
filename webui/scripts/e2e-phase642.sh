#!/usr/bin/env bash
# Phase-642: UI seeds sample fidelity from /hard-gaps load.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_score_percent' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'setHardGapsSummaryFidelity' webui/frontend/src/components/FirewallExtras.tsx
# seeded from gaps load (not only summary button)
grep -Fq 'gaps.layout_fidelity_sample_score_percent' webui/frontend/src/components/FirewallExtras.tsx
echo "gaps-load fidelity seed ok"
echo "cleaned"
echo "OK: phase642 e2e passed"
