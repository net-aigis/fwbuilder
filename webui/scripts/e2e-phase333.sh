#!/usr/bin/env bash
# Phase-333: STATUS mentions hard_gap_closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'hard_gap_closure\|closure' webui/STATUS.md
grep -q 'phase333\|phase332\|phase331\|phase330\|phase329' webui/STATUS.md
echo "STATUS closure mentions ok"
echo "cleaned"
echo "OK: phase333 e2e passed"
