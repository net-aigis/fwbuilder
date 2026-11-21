#!/usr/bin/env bash
# Phase-4604: STATUS mentions Soft 4600+ / 4601-4608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 4600\+|4600\+ Checkpoint|Soft-4600' webui/STATUS.md
grep -qE 'phase4608|through 4608|e2e-phase4608' webui/STATUS.md
echo "STATUS Soft 4600+ ok"
echo "cleaned"
echo "OK: phase4604 e2e passed"
