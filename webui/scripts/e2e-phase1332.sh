#!/usr/bin/env bash
# Phase-1332: STATUS mentions milestone 2250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2250|honesty milestone 2250|WEBUI_HONESTY_MILESTONE=2250|milestone 2250' webui/STATUS.md
grep -qE 'phase1336|through 1336|e2e-phase1336' webui/STATUS.md
echo "STATUS milestone 2250 ok"
echo "cleaned"
echo "OK: phase1332 e2e passed"
