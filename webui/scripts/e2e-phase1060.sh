#!/usr/bin/env bash
# Phase-1060: STATUS mentions pages_with_buddy_labels / 1057-1064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'pages_with_buddy_labels|pageBuddies=|layout_fidelity_sample_pages_with_buddy_labels' webui/STATUS.md
grep -qE 'phase1064|through 1064|e2e-phase1064' webui/STATUS.md
echo "STATUS pages_with_buddy_labels ok"
echo "cleaned"
echo "OK: phase1060 e2e passed"
