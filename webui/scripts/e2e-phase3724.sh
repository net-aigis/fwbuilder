#!/usr/bin/env bash
# Phase-3724: STATUS mentions Soft 3720+ / 3721-3728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3720\+|3720\+ Checkpoint|Soft-3720' webui/STATUS.md
grep -qE 'phase3728|through 3728|e2e-phase3728' webui/STATUS.md
echo "STATUS Soft 3720+ ok"
echo "cleaned"
echo "OK: phase3724 e2e passed"
