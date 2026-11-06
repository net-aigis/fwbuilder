#!/usr/bin/env bash
# Phase-4044: STATUS mentions Soft 4040+ / 4041-4048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 4040\+|4040\+ Checkpoint|Soft-4040' webui/STATUS.md
grep -qE 'phase4048|through 4048|e2e-phase4048' webui/STATUS.md
echo "STATUS Soft 4040+ ok"
echo "cleaned"
echo "OK: phase4044 e2e passed"
