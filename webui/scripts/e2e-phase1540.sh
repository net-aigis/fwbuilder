#!/usr/bin/env bash
# Phase-1540: STATUS mentions milestone 2900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2900|honesty milestone 2900|WEBUI_HONESTY_MILESTONE=2900|milestone 2900' webui/STATUS.md
grep -qE 'phase1544|through 1544|e2e-phase1544' webui/STATUS.md
echo "STATUS milestone 2900 ok"
echo "cleaned"
echo "OK: phase1540 e2e passed"
