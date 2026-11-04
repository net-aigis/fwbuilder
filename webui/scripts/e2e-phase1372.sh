#!/usr/bin/env bash
# Phase-1372: STATUS mentions summary honesty_paths / 1369-1376.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_paths.*(summary|mirror)|summary.*honesty_paths' webui/STATUS.md
grep -qE 'phase1376|through 1376|e2e-phase1376' webui/STATUS.md
echo "STATUS summary honesty_paths ok"
echo "cleaned"
echo "OK: phase1372 e2e passed"
