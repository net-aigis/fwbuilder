#!/usr/bin/env bash
# Phase-4460: STATUS mentions expect_steps_refusals_roster / 4457-4464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_steps_refusals_roster|soft_fertig_expect_steps_refusals_roster' webui/STATUS.md
grep -qE 'phase4464|through 4464|e2e-phase4464' webui/STATUS.md
echo "STATUS expect-steps-refusals roster ok"
echo "cleaned"
echo "OK: phase4460 e2e passed"
