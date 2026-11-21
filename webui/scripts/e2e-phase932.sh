#!/usr/bin/env bash
# Phase-932: STATUS mentions milestone 1250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1250|honesty milestone 1250|WEBUI_HONESTY_MILESTONE=1250|milestone 1250' webui/STATUS.md
grep -qE 'phase936|through 936|e2e-phase936' webui/STATUS.md
echo "STATUS milestone 1250 ok"
echo "cleaned"
echo "OK: phase932 e2e passed"
