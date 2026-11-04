#!/usr/bin/env bash
# Phase-1260: STATUS mentions milestone 2050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2050|honesty milestone 2050|WEBUI_HONESTY_MILESTONE=2050|milestone 2050' webui/STATUS.md
grep -qE 'phase1264|through 1264|e2e-phase1264' webui/STATUS.md
echo "STATUS milestone 2050 ok"
echo "cleaned"
echo "OK: phase1260 e2e passed"
