#!/usr/bin/env bash
# Phase-2620: STATUS mentions honesty bundle roster / 2617-2624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_bundle_roster|honesty bundle roster' webui/STATUS.md
grep -qE 'phase2624|through 2624|e2e-phase2624' webui/STATUS.md
echo "STATUS honesty bundle roster ok"
echo "cleaned"
echo "OK: phase2620 e2e passed"
