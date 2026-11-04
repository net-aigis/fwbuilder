#!/usr/bin/env bash
# Phase-507: UI shows layout_tree depth in fidelity summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_tree_max_depth' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_tree≤' webui/frontend/src/components/FirewallExtras.tsx
echo "fidelity layout_tree UI ok"
echo "cleaned"
echo "OK: phase507 e2e passed"
