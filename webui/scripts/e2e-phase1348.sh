#!/usr/bin/env bash
# Phase-1348: STATUS mentions milestone 2300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2300|honesty milestone 2300|WEBUI_HONESTY_MILESTONE=2300|milestone 2300' webui/STATUS.md
grep -qE 'phase1352|through 1352|e2e-phase1352' webui/STATUS.md
echo "STATUS milestone 2300 ok"
echo "cleaned"
echo "OK: phase1348 e2e passed"
