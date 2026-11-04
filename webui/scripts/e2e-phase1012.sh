#!/usr/bin/env bash
# Phase-1012: STATUS mentions with_alignment / 1009-1016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_alignment|align=|layout_fidelity_sample_with_alignment' webui/STATUS.md
grep -qE 'phase1016|through 1016|e2e-phase1016' webui/STATUS.md
echo "STATUS with_alignment ok"
echo "cleaned"
echo "OK: phase1012 e2e passed"
