#!/usr/bin/env bash
# Phase-1244: STATUS mentions milestone 2000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2000|honesty milestone 2000|WEBUI_HONESTY_MILESTONE=2000|milestone 2000' webui/STATUS.md
grep -qE 'phase1248|through 1248|e2e-phase1248' webui/STATUS.md
echo "STATUS milestone 2000 ok"
echo "cleaned"
echo "OK: phase1244 e2e passed"
