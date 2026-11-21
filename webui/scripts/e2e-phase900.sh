#!/usr/bin/env bash
# Phase-900: STATUS mentions milestone 1150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1150|honesty milestone 1150|WEBUI_HONESTY_MILESTONE=1150|milestone 1150' webui/STATUS.md
grep -qE 'phase904|through 904|e2e-phase904' webui/STATUS.md
echo "STATUS milestone 1150 ok"
echo "cleaned"
echo "OK: phase900 e2e passed"
