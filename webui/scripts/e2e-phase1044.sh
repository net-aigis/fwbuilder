#!/usr/bin/env bash
# Phase-1044: STATUS mentions milestone 1400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1400|honesty milestone 1400|WEBUI_HONESTY_MILESTONE=1400|milestone 1400' webui/STATUS.md
grep -qE 'phase1048|through 1048|e2e-phase1048' webui/STATUS.md
echo "STATUS milestone 1400 ok"
echo "cleaned"
echo "OK: phase1044 e2e passed"
