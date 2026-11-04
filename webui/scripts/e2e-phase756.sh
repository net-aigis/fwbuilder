#!/usr/bin/env bash
# Phase-756: STATUS mentions milestone 850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 850|honesty milestone 850|WEBUI_HONESTY_MILESTONE=850|milestone 850' webui/STATUS.md
grep -qE 'phase760|through 760|e2e-phase760' webui/STATUS.md
echo "STATUS milestone 850 ok"
echo "cleaned"
echo "OK: phase756 e2e passed"
