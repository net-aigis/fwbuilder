#!/usr/bin/env bash
# Phase-1156: STATUS mentions hard_gap_closure_titles / 1153-1160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'hard_gap_closure_titles|closure titles' webui/STATUS.md
grep -qE 'phase1160|through 1160|e2e-phase1160' webui/STATUS.md
echo "STATUS hard_gap_closure_titles ok"
echo "cleaned"
echo "OK: phase1156 e2e passed"
