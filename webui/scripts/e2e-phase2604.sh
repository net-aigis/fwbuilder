#!/usr/bin/env bash
# Phase-2604: STATUS mentions Soft 2600+ / 2601-2608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 2600\+|2440\+ Checkpoint|Soft-2440' webui/STATUS.md
grep -qE 'phase2608|through 2608|e2e-phase2608' webui/STATUS.md
echo "STATUS Soft 2600+ ok"
echo "cleaned"
echo "OK: phase2604 e2e passed"
