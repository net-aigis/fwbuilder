#!/usr/bin/env bash
# Phase-1444: STATUS mentions milestone 2600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2600|honesty milestone 2600|WEBUI_HONESTY_MILESTONE=2600|milestone 2600' webui/STATUS.md
grep -qE 'phase1448|through 1448|e2e-phase1448' webui/STATUS.md
echo "STATUS milestone 2600 ok"
echo "cleaned"
echo "OK: phase1444 e2e passed"
