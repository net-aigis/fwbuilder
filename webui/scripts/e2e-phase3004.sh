#!/usr/bin/env bash
# Phase-3004: STATUS mentions Soft 3000+ / 3001-3008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3000\+|3000\+ Checkpoint|Soft-3000' webui/STATUS.md
grep -qE 'phase3008|through 3008|e2e-phase3008' webui/STATUS.md
echo "STATUS Soft 3000+ ok"
echo "cleaned"
echo "OK: phase3004 e2e passed"
