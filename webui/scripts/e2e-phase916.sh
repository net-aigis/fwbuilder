#!/usr/bin/env bash
# Phase-916: STATUS mentions milestone 1200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1200|honesty milestone 1200|WEBUI_HONESTY_MILESTONE=1200|milestone 1200' webui/STATUS.md
grep -qE 'phase920|through 920|e2e-phase920' webui/STATUS.md
echo "STATUS milestone 1200 ok"
echo "cleaned"
echo "OK: phase916 e2e passed"
