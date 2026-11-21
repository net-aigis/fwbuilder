#!/usr/bin/env bash
# Phase-884: STATUS mentions milestone 1100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1100|honesty milestone 1100|WEBUI_HONESTY_MILESTONE=1100|milestone 1100' webui/STATUS.md
grep -qE 'phase888|through 888|e2e-phase888' webui/STATUS.md
echo "STATUS milestone 1100 ok"
echo "cleaned"
echo "OK: phase884 e2e passed"
