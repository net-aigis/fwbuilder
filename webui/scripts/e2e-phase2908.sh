#!/usr/bin/env bash
# Phase-2908: STATUS mentions expect_step_roster sessionStorage / 2905-2912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_step_roster.*(sessionStorage|Clear)|sessionStorage.*expect_step_roster' webui/STATUS.md
grep -qE 'phase2912|through 2912|e2e-phase2912' webui/STATUS.md
echo "STATUS expect_step_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2908 e2e passed"
