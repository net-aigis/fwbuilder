#!/usr/bin/env bash
# Phase-4476: STATUS mentions expect_steps_refusals_roster export / 4473-4480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_steps_refusals_roster.*(export|bundle)|Export.*expect_steps_refusals_roster' webui/STATUS.md
grep -qE 'phase4480|through 4480|e2e-phase4480' webui/STATUS.md
echo "STATUS expect_steps_refusals_roster export ok"
echo "cleaned"
echo "OK: phase4476 e2e passed"
