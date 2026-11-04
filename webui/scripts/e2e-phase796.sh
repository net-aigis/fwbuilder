#!/usr/bin/env bash
# Phase-796: STATUS mentions milestone 900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 900|honesty milestone 900|WEBUI_HONESTY_MILESTONE=900|milestone 900' webui/STATUS.md
grep -qE 'phase800|through 800|e2e-phase800' webui/STATUS.md
echo "STATUS milestone 900 ok"
echo "cleaned"
echo "OK: phase796 e2e passed"
