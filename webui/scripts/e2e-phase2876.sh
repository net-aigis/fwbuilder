#!/usr/bin/env bash
# Phase-2876: STATUS mentions expect_step_roster export / 2873-2880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_step_roster.*(export|bundle)|export.*expect_step_roster|bundle.*expect_step_roster' webui/STATUS.md
grep -qE 'phase2880|through 2880|e2e-phase2880' webui/STATUS.md
echo "STATUS expect_step_roster export ok"
echo "cleaned"
echo "OK: phase2876 e2e passed"
