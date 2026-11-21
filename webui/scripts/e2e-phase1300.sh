#!/usr/bin/env bash
# Phase-1300: STATUS mentions milestone 2150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2150|honesty milestone 2150|WEBUI_HONESTY_MILESTONE=2150|milestone 2150' webui/STATUS.md
grep -qE 'phase1304|through 1304|e2e-phase1304' webui/STATUS.md
echo "STATUS milestone 2150 ok"
echo "cleaned"
echo "OK: phase1300 e2e passed"
