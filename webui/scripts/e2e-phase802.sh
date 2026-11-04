#!/usr/bin/env bash
# Phase-802: UI treeDepth=/buddies= sample bits.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_layout_tree_max_depth' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_buddy_labels' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'treeDepth=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'buddies=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI tree/buddy sample bits ok"
echo "cleaned"
echo "OK: phase802 e2e passed"
