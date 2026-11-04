#!/usr/bin/env bash
# Phase-1364: STATUS mentions milestone 2350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2350|honesty milestone 2350|WEBUI_HONESTY_MILESTONE=2350|milestone 2350' webui/STATUS.md
grep -qE 'phase1368|through 1368|e2e-phase1368' webui/STATUS.md
echo "STATUS milestone 2350 ok"
echo "cleaned"
echo "OK: phase1364 e2e passed"
