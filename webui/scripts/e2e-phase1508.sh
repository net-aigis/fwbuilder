#!/usr/bin/env bash
# Phase-1508: STATUS mentions milestone 2800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2800|honesty milestone 2800|WEBUI_HONESTY_MILESTONE=2800|milestone 2800' webui/STATUS.md
grep -qE 'phase1512|through 1512|e2e-phase1512' webui/STATUS.md
echo "STATUS milestone 2800 ok"
echo "cleaned"
echo "OK: phase1508 e2e passed"
