#!/usr/bin/env bash
# Phase-1220: STATUS mentions honesty_path_notes / 1217-1224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_path_notes|honesty path notes' webui/STATUS.md
grep -qE 'phase1224|through 1224|e2e-phase1224' webui/STATUS.md
echo "STATUS honesty_path_notes ok"
echo "cleaned"
echo "OK: phase1220 e2e passed"
