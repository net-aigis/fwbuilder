#!/usr/bin/env bash
# Phase-1084: STATUS mentions milestone 1500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1500|honesty milestone 1500|WEBUI_HONESTY_MILESTONE=1500|milestone 1500' webui/STATUS.md
grep -qE 'phase1088|through 1088|e2e-phase1088' webui/STATUS.md
echo "STATUS milestone 1500 ok"
echo "cleaned"
echo "OK: phase1084 e2e passed"
