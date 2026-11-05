#!/usr/bin/env bash
# Phase-3404: STATUS mentions Soft 3400+ / 3401-3408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3400\+|3400\+ Checkpoint|Soft-3400' webui/STATUS.md
grep -qE 'phase3408|through 3408|e2e-phase3408' webui/STATUS.md
echo "STATUS Soft 3400+ ok"
echo "cleaned"
echo "OK: phase3404 e2e passed"
