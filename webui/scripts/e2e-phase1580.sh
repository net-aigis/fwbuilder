#!/usr/bin/env bash
# Phase-1580: STATUS mentions honesty export / 1577-1584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty.?export' webui/STATUS.md
grep -qE 'phase1584|through 1584|e2e-phase1584' webui/STATUS.md
echo "STATUS honesty export ok"
echo "cleaned"
echo "OK: phase1580 e2e passed"
