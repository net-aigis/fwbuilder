#!/usr/bin/env bash
# Phase-684: STATUS mentions milestone 700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 700|honesty milestone 700|WEBUI_HONESTY_MILESTONE=700|milestone 700' webui/STATUS.md
grep -qE 'phase688|through 688|e2e-phase688' webui/STATUS.md
echo "STATUS milestone 700 ok"
echo "cleaned"
echo "OK: phase684 e2e passed"
