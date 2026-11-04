#!/usr/bin/env bash
# Phase-2284: STATUS mentions Soft 2280+ / 2281-2288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 2280\+|2280\+ Checkpoint|Soft-2280' webui/STATUS.md
grep -qE 'phase2288|through 2288|e2e-phase2288' webui/STATUS.md
echo "STATUS Soft 2280+ ok"
echo "cleaned"
echo "OK: phase2284 e2e passed"
