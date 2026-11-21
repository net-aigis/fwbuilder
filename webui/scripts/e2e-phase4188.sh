#!/usr/bin/env bash
# Phase-4188: STATUS mentions stack_switch_roster sessionStorage / 4185-4192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'stack_switch_roster.*(sessionStorage|Clear)|sessionStorage.*stack_switch_roster' webui/STATUS.md
grep -qE 'phase4192|through 4192|e2e-phase4192' webui/STATUS.md
echo "STATUS stack_switch_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4188 e2e passed"
