#!/usr/bin/env bash
# Phase-1028: STATUS mentions pages_with_row_stretch / 1025-1032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'pages_with_row_stretch|rowStretch=|layout_fidelity_sample_pages_with_row_stretch' webui/STATUS.md
grep -qE 'phase1032|through 1032|e2e-phase1032' webui/STATUS.md
echo "STATUS pages_with_row_stretch ok"
echo "cleaned"
echo "OK: phase1028 e2e passed"
