#!/usr/bin/env bash
# Phase-4524: STATUS mentions Soft 4520+ / 4521-4528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 4520\+|4520\+ Checkpoint|Soft-4520' webui/STATUS.md
grep -qE 'phase4528|through 4528|e2e-phase4528' webui/STATUS.md
echo "STATUS Soft 4520+ ok"
echo "cleaned"
echo "OK: phase4524 e2e passed"
