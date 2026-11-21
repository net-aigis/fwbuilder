#!/usr/bin/env bash
# Phase-4364: STATUS mentions Soft 4360+ / 4361-4368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 4360\+|4360\+ Checkpoint|Soft-4360' webui/STATUS.md
grep -qE 'phase4368|through 4368|e2e-phase4368' webui/STATUS.md
echo "STATUS Soft 4360+ ok"
echo "cleaned"
echo "OK: phase4364 e2e passed"
