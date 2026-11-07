#!/usr/bin/env bash
# Phase-4140: STATUS mentions stack_switch_roster / 4137-4144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'stack_switch_roster|soft_fertig_stack_switch_roster' webui/STATUS.md
grep -qE 'phase4144|through 4144|e2e-phase4144' webui/STATUS.md
echo "STATUS stack-switch roster ok"
echo "cleaned"
echo "OK: phase4140 e2e passed"
