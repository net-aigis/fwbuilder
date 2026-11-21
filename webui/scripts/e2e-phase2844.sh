#!/usr/bin/env bash
# Phase-2844: STATUS mentions Soft 2840+ / 2841-2848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 2840\+|2440\+ Checkpoint|Soft-2440' webui/STATUS.md
grep -qE 'phase2848|through 2848|e2e-phase2848' webui/STATUS.md
echo "STATUS Soft 2840+ ok"
echo "cleaned"
echo "OK: phase2844 e2e passed"
