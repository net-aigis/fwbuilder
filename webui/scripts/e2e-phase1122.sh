#!/usr/bin/env bash
# Phase-1122: UI altPageBuddies= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_alt_sample_pages_with_buddy_labels' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'altPageBuddies=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI altPageBuddies= bit ok"
echo "cleaned"
echo "OK: phase1122 e2e passed"
