#!/usr/bin/env bash
# Phase-3244: STATUS mentions Soft 3240+ / 3241-3248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3240\+|3240\+ Checkpoint|Soft-3240' webui/STATUS.md
grep -qE 'phase3248|through 3248|e2e-phase3248' webui/STATUS.md
echo "STATUS Soft 3240+ ok"
echo "cleaned"
echo "OK: phase3244 e2e passed"
