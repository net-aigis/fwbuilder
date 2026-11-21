#!/usr/bin/env bash
# Phase-1138: UI open labels bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_open_labels' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsOpenLabels' webui/frontend/src/components/FirewallExtras.tsx
echo "UI open labels ok"
echo "cleaned"
echo "OK: phase1138 e2e passed"
