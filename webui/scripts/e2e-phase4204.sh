#!/usr/bin/env bash
# Phase-4204: STATUS mentions Soft 4200+ / 4201-4208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 4200\+|4200\+ Checkpoint|Soft-4200' webui/STATUS.md
grep -qE 'phase4208|through 4208|e2e-phase4208' webui/STATUS.md
echo "STATUS Soft 4200+ ok"
echo "cleaned"
echo "OK: phase4204 e2e passed"
