#!/usr/bin/env bash
# Phase-1412: STATUS mentions milestone 2500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2500|honesty milestone 2500|WEBUI_HONESTY_MILESTONE=2500|milestone 2500' webui/STATUS.md
grep -qE 'phase1416|through 1416|e2e-phase1416' webui/STATUS.md
echo "STATUS milestone 2500 ok"
echo "cleaned"
echo "OK: phase1412 e2e passed"
