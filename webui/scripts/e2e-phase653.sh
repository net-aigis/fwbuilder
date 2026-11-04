#!/usr/bin/env bash
# Phase-653: STATUS mentions milestone 650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 650|honesty milestone 650|WEBUI_HONESTY_MILESTONE=650|milestone 650' webui/STATUS.md
grep -qE 'phase656|through 656|e2e-phase656' webui/STATUS.md
echo "STATUS milestone 650 ok"
echo "cleaned"
echo "OK: phase653 e2e passed"
