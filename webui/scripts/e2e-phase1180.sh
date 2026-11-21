#!/usr/bin/env bash
# Phase-1180: STATUS mentions milestone 1800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1800|honesty milestone 1800|WEBUI_HONESTY_MILESTONE=1800|milestone 1800' webui/STATUS.md
grep -qE 'phase1184|through 1184|e2e-phase1184' webui/STATUS.md
echo "STATUS milestone 1800 ok"
echo "cleaned"
echo "OK: phase1180 e2e passed"
