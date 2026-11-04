#!/usr/bin/env bash
# Phase-588: STATUS 585–592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase585\|e2e-phase585' webui/STATUS.md
grep -q 'phase592\|e2e-phase592' webui/STATUS.md
grep -qi 'unknown_step_probe' webui/STATUS.md
echo "STATUS 585-592 ok"
echo "cleaned"
echo "OK: phase588 e2e passed"
