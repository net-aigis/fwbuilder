#!/usr/bin/env bash
# Phase-4396: STATUS mentions expect_steps_roster export / 4393-4400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_steps_roster.*(export|bundle)|Export.*expect_steps_roster' webui/STATUS.md
grep -qE 'phase4400|through 4400|e2e-phase4400' webui/STATUS.md
echo "STATUS expect_steps_roster export ok"
echo "cleaned"
echo "OK: phase4396 e2e passed"
