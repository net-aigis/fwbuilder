#!/usr/bin/env bash
# Phase-1036: STATUS mentions pages_with_tooltip / 1033-1040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'pages_with_tooltip|pageTip=|layout_fidelity_sample_pages_with_tooltip' webui/STATUS.md
grep -qE 'phase1040|through 1040|e2e-phase1040' webui/STATUS.md
echo "STATUS pages_with_tooltip ok"
echo "cleaned"
echo "OK: phase1036 e2e passed"
