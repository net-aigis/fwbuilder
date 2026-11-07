#!/usr/bin/env bash
# Phase-4284: STATUS mentions Soft 4280+ / 4281-4288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 4280\+|4280\+ Checkpoint|Soft-4280' webui/STATUS.md
grep -qE 'phase4288|through 4288|e2e-phase4288' webui/STATUS.md
echo "STATUS Soft 4280+ ok"
echo "cleaned"
echo "OK: phase4284 e2e passed"
