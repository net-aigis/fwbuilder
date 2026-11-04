#!/usr/bin/env bash
# Phase-2924: STATUS mentions Soft 2920+ / 2921-2928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 2920\+|2920\+ Checkpoint|Soft-2920' webui/STATUS.md
grep -qE 'phase2928|through 2928|e2e-phase2928' webui/STATUS.md
echo "STATUS Soft 2920+ ok"
echo "cleaned"
echo "OK: phase2924 e2e passed"
