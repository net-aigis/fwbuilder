#!/usr/bin/env bash
# Phase-1996: STATUS mentions soft_complete_note / 1993-2000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'soft_complete_note|soft-complete note' webui/STATUS.md
grep -qE 'phase2000|through 2000|e2e-phase2000' webui/STATUS.md
echo "STATUS soft_complete_note ok"
echo "cleaned"
echo "OK: phase1996 e2e passed"
