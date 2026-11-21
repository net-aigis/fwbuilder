#!/usr/bin/env bash
# Phase-2364: STATUS mentions Soft 2360+ / 2361-2368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 2360\+|2360\+ Checkpoint|Soft-2360' webui/STATUS.md
grep -qE 'phase2368|through 2368|e2e-phase2368' webui/STATUS.md
echo "STATUS Soft 2360+ ok"
echo "cleaned"
echo "OK: phase2364 e2e passed"
