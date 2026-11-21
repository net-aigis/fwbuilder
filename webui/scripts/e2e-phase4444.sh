#!/usr/bin/env bash
# Phase-4444: STATUS mentions Soft 4440+ / 4441-4448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 4440\+|4440\+ Checkpoint|Soft-4440' webui/STATUS.md
grep -qE 'phase4448|through 4448|e2e-phase4448' webui/STATUS.md
echo "STATUS Soft 4440+ ok"
echo "cleaned"
echo "OK: phase4444 e2e passed"
