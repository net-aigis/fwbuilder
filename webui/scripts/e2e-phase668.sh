#!/usr/bin/env bash
# Phase-668: STATUS mentions 665-672 step notes count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'expect_plan_step_notes_count|expect_plan_step_count|notes_count' webui/STATUS.md
grep -qE 'phase672|through 672|e2e-phase672' webui/STATUS.md
echo "STATUS 665-672 ok"
echo "cleaned"
echo "OK: phase668 e2e passed"
