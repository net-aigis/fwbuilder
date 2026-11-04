#!/usr/bin/env bash
# Phase-540: STATUS 537–544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase537\|e2e-phase537' webui/STATUS.md
grep -q 'phase544\|e2e-phase544' webui/STATUS.md
grep -qi 'score_parts_count\|weights×' webui/STATUS.md
echo "STATUS 537-544 ok"
echo "cleaned"
echo "OK: phase540 e2e passed"
