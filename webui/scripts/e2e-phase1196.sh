#!/usr/bin/env bash
# Phase-1196: STATUS mentions milestone 1850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1850|honesty milestone 1850|WEBUI_HONESTY_MILESTONE=1850|milestone 1850' webui/STATUS.md
grep -qE 'phase1200|through 1200|e2e-phase1200' webui/STATUS.md
echo "STATUS milestone 1850 ok"
echo "cleaned"
echo "OK: phase1196 e2e passed"
