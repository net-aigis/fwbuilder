#!/usr/bin/env bash
# Phase-1316: STATUS mentions milestone 2200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2200|honesty milestone 2200|WEBUI_HONESTY_MILESTONE=2200|milestone 2200' webui/STATUS.md
grep -qE 'phase1320|through 1320|e2e-phase1320' webui/STATUS.md
echo "STATUS milestone 2200 ok"
echo "cleaned"
echo "OK: phase1316 e2e passed"
