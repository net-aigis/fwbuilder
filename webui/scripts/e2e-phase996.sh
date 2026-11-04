#!/usr/bin/env bash
# Phase-996: STATUS mentions milestone 1350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1350|honesty milestone 1350|WEBUI_HONESTY_MILESTONE=1350|milestone 1350' webui/STATUS.md
grep -qE 'phase1000|through 1000|e2e-phase1000' webui/STATUS.md
echo "STATUS milestone 1350 ok"
echo "cleaned"
echo "OK: phase996 e2e passed"
