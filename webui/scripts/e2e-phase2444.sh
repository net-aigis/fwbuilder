#!/usr/bin/env bash
# Phase-2444: STATUS mentions Soft 2440+ / 2441-2448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 2440\+|2440\+ Checkpoint|Soft-2440' webui/STATUS.md
grep -qE 'phase2448|through 2448|e2e-phase2448' webui/STATUS.md
echo "STATUS Soft 2440+ ok"
echo "cleaned"
echo "OK: phase2444 e2e passed"
