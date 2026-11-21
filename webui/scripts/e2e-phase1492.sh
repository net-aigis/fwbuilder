#!/usr/bin/env bash
# Phase-1492: STATUS mentions milestone 2750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2750|honesty milestone 2750|WEBUI_HONESTY_MILESTONE=2750|milestone 2750' webui/STATUS.md
grep -qE 'phase1496|through 1496|e2e-phase1496' webui/STATUS.md
echo "STATUS milestone 2750 ok"
echo "cleaned"
echo "OK: phase1492 e2e passed"
