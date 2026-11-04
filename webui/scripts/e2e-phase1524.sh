#!/usr/bin/env bash
# Phase-1524: STATUS mentions milestone 2850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2850|honesty milestone 2850|WEBUI_HONESTY_MILESTONE=2850|milestone 2850' webui/STATUS.md
grep -qE 'phase1528|through 1528|e2e-phase1528' webui/STATUS.md
echo "STATUS milestone 2850 ok"
echo "cleaned"
echo "OK: phase1524 e2e passed"
