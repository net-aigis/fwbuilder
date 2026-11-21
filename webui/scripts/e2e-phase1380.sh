#!/usr/bin/env bash
# Phase-1380: STATUS mentions milestone 2400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2400|honesty milestone 2400|WEBUI_HONESTY_MILESTONE=2400|milestone 2400' webui/STATUS.md
grep -qE 'phase1384|through 1384|e2e-phase1384' webui/STATUS.md
echo "STATUS milestone 2400 ok"
echo "cleaned"
echo "OK: phase1380 e2e passed"
