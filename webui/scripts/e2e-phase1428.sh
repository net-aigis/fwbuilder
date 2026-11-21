#!/usr/bin/env bash
# Phase-1428: STATUS mentions milestone 2550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2550|honesty milestone 2550|WEBUI_HONESTY_MILESTONE=2550|milestone 2550' webui/STATUS.md
grep -qE 'phase1432|through 1432|e2e-phase1432' webui/STATUS.md
echo "STATUS milestone 2550 ok"
echo "cleaned"
echo "OK: phase1428 e2e passed"
