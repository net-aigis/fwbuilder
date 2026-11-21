#!/usr/bin/env bash
# Phase-3644: STATUS mentions Soft 3640+ / 3641-3648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3640\+|3640\+ Checkpoint|Soft-3640' webui/STATUS.md
grep -qE 'phase3648|through 3648|e2e-phase3648' webui/STATUS.md
echo "STATUS Soft 3640+ ok"
echo "cleaned"
echo "OK: phase3644 e2e passed"
