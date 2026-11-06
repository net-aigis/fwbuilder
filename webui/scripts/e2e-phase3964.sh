#!/usr/bin/env bash
# Phase-3964: STATUS mentions Soft 3960+ / 3961-3968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3960\+|3960\+ Checkpoint|Soft-3960' webui/STATUS.md
grep -qE 'phase3968|through 3968|e2e-phase3968' webui/STATUS.md
echo "STATUS Soft 3960+ ok"
echo "cleaned"
echo "OK: phase3964 e2e passed"
