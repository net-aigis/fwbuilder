#!/usr/bin/env bash
# Phase-740: STATUS mentions milestone 800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 800|honesty milestone 800|WEBUI_HONESTY_MILESTONE=800|milestone 800' webui/STATUS.md
grep -qE 'phase744|through 744|e2e-phase744' webui/STATUS.md
echo "STATUS milestone 800 ok"
echo "cleaned"
echo "OK: phase740 e2e passed"
