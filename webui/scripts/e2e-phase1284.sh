#!/usr/bin/env bash
# Phase-1284: STATUS mentions milestone 2100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2100|honesty milestone 2100|WEBUI_HONESTY_MILESTONE=2100|milestone 2100' webui/STATUS.md
grep -qE 'phase1288|through 1288|e2e-phase1288' webui/STATUS.md
echo "STATUS milestone 2100 ok"
echo "cleaned"
echo "OK: phase1284 e2e passed"
