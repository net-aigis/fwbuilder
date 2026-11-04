#!/usr/bin/env bash
# Phase-948: STATUS mentions milestone 1300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1300|honesty milestone 1300|WEBUI_HONESTY_MILESTONE=1300|milestone 1300' webui/STATUS.md
grep -qE 'phase952|through 952|e2e-phase952' webui/STATUS.md
echo "STATUS milestone 1300 ok"
echo "cleaned"
echo "OK: phase948 e2e passed"
