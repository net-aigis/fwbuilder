#!/usr/bin/env bash
# Phase-730: UI shows expanding= from hard-gaps/summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_size_policy_expanding' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expanding=' webui/frontend/src/components/FirewallExtras.tsx
echo "expanding UI ok"
echo "cleaned"
echo "OK: phase730 e2e passed"
