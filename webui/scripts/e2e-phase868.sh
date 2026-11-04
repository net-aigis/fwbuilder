#!/usr/bin/env bash
# Phase-868: STATUS mentions milestone 1050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1050|honesty milestone 1050|WEBUI_HONESTY_MILESTONE=1050|milestone 1050' webui/STATUS.md
grep -qE 'phase872|through 872|e2e-phase872' webui/STATUS.md
echo "STATUS milestone 1050 ok"
echo "cleaned"
echo "OK: phase868 e2e passed"
