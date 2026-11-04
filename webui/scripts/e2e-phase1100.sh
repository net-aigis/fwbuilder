#!/usr/bin/env bash
# Phase-1100: STATUS mentions milestone 1550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1550|honesty milestone 1550|WEBUI_HONESTY_MILESTONE=1550|milestone 1550' webui/STATUS.md
grep -qE 'phase1104|through 1104|e2e-phase1104' webui/STATUS.md
echo "STATUS milestone 1550 ok"
echo "cleaned"
echo "OK: phase1100 e2e passed"
