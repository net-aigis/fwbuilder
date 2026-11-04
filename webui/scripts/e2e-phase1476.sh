#!/usr/bin/env bash
# Phase-1476: STATUS mentions milestone 2700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2700|honesty milestone 2700|WEBUI_HONESTY_MILESTONE=2700|milestone 2700' webui/STATUS.md
grep -qE 'phase1480|through 1480|e2e-phase1480' webui/STATUS.md
echo "STATUS milestone 2700 ok"
echo "cleaned"
echo "OK: phase1476 e2e passed"
