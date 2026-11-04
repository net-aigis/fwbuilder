#!/usr/bin/env bash
# Phase-1628: STATUS mentions honesty bundle in surface / 1625-1632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty.?bundle.*(surface|in surface)|surface.*honesty.?bundle' webui/STATUS.md
grep -qE 'phase1632|through 1632|e2e-phase1632' webui/STATUS.md
echo "STATUS surface+honesty bundle ok"
echo "cleaned"
echo "OK: phase1628 e2e passed"
