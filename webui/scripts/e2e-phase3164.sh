#!/usr/bin/env bash
# Phase-3164: STATUS mentions Soft 3160+ / 3161-3168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3160\+|3160\+ Checkpoint|Soft-3160' webui/STATUS.md
grep -qE 'phase3168|through 3168|e2e-phase3168' webui/STATUS.md
echo "STATUS Soft 3160+ ok"
echo "cleaned"
echo "OK: phase3164 e2e passed"
