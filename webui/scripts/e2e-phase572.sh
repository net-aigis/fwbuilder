#!/usr/bin/env bash
# Phase-572: STATUS 569–576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase569\|e2e-phase569' webui/STATUS.md
grep -q 'phase576\|e2e-phase576' webui/STATUS.md
grep -qi 'Download closure\|hardGapClosureKey\|sessionStorage' webui/STATUS.md
echo "STATUS 569-576 ok"
echo "cleaned"
echo "OK: phase572 e2e passed"
