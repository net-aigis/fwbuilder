#!/usr/bin/env bash
# Phase-3084: STATUS mentions Soft 3080+ / 3081-3088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3080\+|3080\+ Checkpoint|Soft-3080' webui/STATUS.md
grep -qE 'phase3088|through 3088|e2e-phase3088' webui/STATUS.md
echo "STATUS Soft 3080+ ok"
echo "cleaned"
echo "OK: phase3084 e2e passed"
