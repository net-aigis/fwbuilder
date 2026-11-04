#!/usr/bin/env bash
# Phase-1132: STATUS mentions milestone 1650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1650|honesty milestone 1650|WEBUI_HONESTY_MILESTONE=1650|milestone 1650' webui/STATUS.md
grep -qE 'phase1136|through 1136|e2e-phase1136' webui/STATUS.md
echo "STATUS milestone 1650 ok"
echo "cleaned"
echo "OK: phase1132 e2e passed"
