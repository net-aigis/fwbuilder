#!/usr/bin/env bash
# Phase-3324: STATUS mentions Soft 3320+ / 3321-3328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3320\+|3320\+ Checkpoint|Soft-3320' webui/STATUS.md
grep -qE 'phase3328|through 3328|e2e-phase3328' webui/STATUS.md
echo "STATUS Soft 3320+ ok"
echo "cleaned"
echo "OK: phase3324 e2e passed"
