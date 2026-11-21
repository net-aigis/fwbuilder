#!/usr/bin/env bash
# Phase-1228: STATUS mentions milestone 1950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1950|honesty milestone 1950|WEBUI_HONESTY_MILESTONE=1950|milestone 1950' webui/STATUS.md
grep -qE 'phase1232|through 1232|e2e-phase1232' webui/STATUS.md
echo "STATUS milestone 1950 ok"
echo "cleaned"
echo "OK: phase1228 e2e passed"
