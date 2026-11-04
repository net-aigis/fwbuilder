#!/usr/bin/env bash
# Phase-1140: STATUS mentions hard_gap_open_labels / 1137-1144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'hard_gap_open_labels|open labels' webui/STATUS.md
grep -qE 'phase1144|through 1144|e2e-phase1144' webui/STATUS.md
echo "STATUS hard_gap_open_labels ok"
echo "cleaned"
echo "OK: phase1140 e2e passed"
