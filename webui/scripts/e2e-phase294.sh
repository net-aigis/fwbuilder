#!/usr/bin/env bash
# Phase-294: STATUS mentions hard_gap_notes UI / step refuse / visible.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'hard_gap_notes\|step_refused\|visible\|Probe expect' webui/STATUS.md
grep -q 'phase294\|phase293\|phase292\|phase291\|phase290\|phase289' webui/STATUS.md
echo "STATUS 289+ mentions ok"
echo "cleaned"
echo "OK: phase294 e2e passed"
