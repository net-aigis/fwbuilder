#!/usr/bin/env bash
# Phase-549: STATUS 545–552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase545\|e2e-phase545' webui/STATUS.md
grep -q 'phase552\|e2e-phase552' webui/STATUS.md
grep -qi 'steps/refusals\|expect_steps_refusals\|Preview all step refusals' webui/STATUS.md
echo "STATUS 545-552 ok"
echo "cleaned"
echo "OK: phase549 e2e passed"
