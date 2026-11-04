#!/usr/bin/env bash
# Phase-1612: STATUS mentions honesty bundle / 1609-1616.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty.?bundle' webui/STATUS.md
grep -qE 'phase1616|through 1616|e2e-phase1616' webui/STATUS.md
echo "STATUS honesty bundle ok"
echo "cleaned"
echo "OK: phase1612 e2e passed"
