#!/usr/bin/env bash
# Phase-279: STATUS mentions buddy_labels / tab_position / external_label.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'buddy_label\|external_label\|tab_position\|tabPosition' webui/STATUS.md
grep -q 'phase279\|phase278\|phase277\|phase276\|phase275\|phase274\|phase273' webui/STATUS.md
echo "STATUS buddy/tab mentions ok"
echo "cleaned"
echo "OK: phase279 e2e passed"
