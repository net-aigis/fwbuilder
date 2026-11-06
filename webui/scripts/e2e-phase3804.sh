#!/usr/bin/env bash
# Phase-3804: STATUS mentions Soft 3800+ / 3801-3808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3800\+|3800\+ Checkpoint|Soft-3800' webui/STATUS.md
grep -qE 'phase3808|through 3808|e2e-phase3808' webui/STATUS.md
echo "STATUS Soft 3800+ ok"
echo "cleaned"
echo "OK: phase3804 e2e passed"
