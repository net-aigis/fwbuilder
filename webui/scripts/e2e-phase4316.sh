#!/usr/bin/env bash
# Phase-4316: STATUS mentions expect_run_roster export / 4313-4320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_run_roster.*(export|bundle)|Export.*expect_run_roster' webui/STATUS.md
grep -qE 'phase4320|through 4320|e2e-phase4320' webui/STATUS.md
echo "STATUS expect_run_roster export ok"
echo "cleaned"
echo "OK: phase4316 e2e passed"
