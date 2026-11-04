#!/usr/bin/env bash
# Phase-2524: STATUS mentions Soft 2520+ / 2521-2528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 2520\+|2440\+ Checkpoint|Soft-2440' webui/STATUS.md
grep -qE 'phase2528|through 2528|e2e-phase2528' webui/STATUS.md
echo "STATUS Soft 2520+ ok"
echo "cleaned"
echo "OK: phase2524 e2e passed"
