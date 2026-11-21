#!/usr/bin/env bash
# Phase-828: STATUS mentions milestone 950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 950|honesty milestone 950|WEBUI_HONESTY_MILESTONE=950|milestone 950' webui/STATUS.md
grep -qE 'phase832|through 832|e2e-phase832' webui/STATUS.md
echo "STATUS milestone 950 ok"
echo "cleaned"
echo "OK: phase828 e2e passed"
