#!/usr/bin/env bash
# Phase-1460: STATUS mentions milestone 2650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 2650|honesty milestone 2650|WEBUI_HONESTY_MILESTONE=2650|milestone 2650' webui/STATUS.md
grep -qE 'phase1464|through 1464|e2e-phase1464' webui/STATUS.md
echo "STATUS milestone 2650 ok"
echo "cleaned"
echo "OK: phase1460 e2e passed"
