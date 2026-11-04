#!/usr/bin/env bash
# Phase-1596: STATUS mentions honesty export in surface / 1593-1600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty.?export.*(surface|in surface)|surface.*honesty.?export' webui/STATUS.md
grep -qE 'phase1600|through 1600|e2e-phase1600' webui/STATUS.md
echo "STATUS surface+honesty export ok"
echo "cleaned"
echo "OK: phase1596 e2e passed"
