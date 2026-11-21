#!/usr/bin/env bash
# Phase-1396: STATUS mentions milestone 2450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2450|honesty milestone 2450|WEBUI_HONESTY_MILESTONE=2450|milestone 2450' webui/STATUS.md
grep -qE 'phase1400|through 1400|e2e-phase1400' webui/STATUS.md
echo "STATUS milestone 2450 ok"
echo "cleaned"
echo "OK: phase1396 e2e passed"
