#!/usr/bin/env bash
# Phase-1124: STATUS mentions alt pages_with_buddy_labels / 1121-1128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'alt pages_with_buddy_labels|altPageBuddies=|layout_fidelity_alt_sample_pages_with_buddy_labels' webui/STATUS.md
grep -qE 'phase1128|through 1128|e2e-phase1128' webui/STATUS.md
echo "STATUS alt pageBuddies ok"
echo "cleaned"
echo "OK: phase1124 e2e passed"
