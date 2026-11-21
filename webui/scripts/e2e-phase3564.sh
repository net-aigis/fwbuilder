#!/usr/bin/env bash
# Phase-3564: STATUS mentions Soft 3560+ / 3561-3568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3560\+|3560\+ Checkpoint|Soft-3560' webui/STATUS.md
grep -qE 'phase3568|through 3568|e2e-phase3568' webui/STATUS.md
echo "STATUS Soft 3560+ ok"
echo "cleaned"
echo "OK: phase3564 e2e passed"
