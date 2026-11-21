#!/usr/bin/env bash
# Phase-468: STATUS 465–472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase465\|e2e-phase465' webui/STATUS.md
grep -q 'phase472\|e2e-phase472' webui/STATUS.md
grep -qi 'expect_plan_step_ids\|Expect steps' webui/STATUS.md
echo "STATUS 465-472 ok"
echo "cleaned"
echo "OK: phase468 e2e passed"
