#!/usr/bin/env bash
# Phase-4380: STATUS mentions expect_steps_roster / 4377-4384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_steps_roster|soft_fertig_expect_steps_roster' webui/STATUS.md
grep -qE 'phase4384|through 4384|e2e-phase4384' webui/STATUS.md
echo "STATUS expect-steps roster ok"
echo "cleaned"
echo "OK: phase4380 e2e passed"
