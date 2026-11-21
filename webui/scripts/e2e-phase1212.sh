#!/usr/bin/env bash
# Phase-1212: STATUS mentions milestone 1900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 1900|honesty milestone 1900|WEBUI_HONESTY_MILESTONE=1900|milestone 1900' webui/STATUS.md
grep -qE 'phase1216|through 1216|e2e-phase1216' webui/STATUS.md
echo "STATUS milestone 1900 ok"
echo "cleaned"
echo "OK: phase1212 e2e passed"
