#!/usr/bin/env bash
# Phase-4156: STATUS mentions stack_switch_roster export / 4153-4160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'stack_switch_roster.*(export|bundle)|Export.*stack_switch_roster' webui/STATUS.md
grep -qE 'phase4160|through 4160|e2e-phase4160' webui/STATUS.md
echo "STATUS stack_switch_roster export ok"
echo "cleaned"
echo "OK: phase4156 e2e passed"
