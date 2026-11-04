#!/usr/bin/env bash
# Phase-2220: STATUS mentions hard-gap roster / 2217-2224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gap_roster|hard-gap roster' webui/STATUS.md
grep -qE 'phase2224|through 2224|e2e-phase2224' webui/STATUS.md
echo "STATUS hard-gap roster ok"
echo "cleaned"
echo "OK: phase2220 e2e passed"
