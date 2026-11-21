#!/usr/bin/env bash
# Phase-478: STATUS 473–480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase473\|e2e-phase473' webui/STATUS.md
grep -q 'phase480\|e2e-phase480' webui/STATUS.md
grep -qi 'expect_steps_path\|expect-install-plan/steps\|canonical_step_ids' webui/STATUS.md
echo "STATUS 473-480 ok"
echo "cleaned"
echo "OK: phase478 e2e passed"
