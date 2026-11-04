#!/usr/bin/env bash
# Phase-2044: STATUS mentions soft_complete_note sessionStorage / 2041-2048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'soft_complete_note.*sessionStorage|sessionStorage.*soft_complete_note|softCompleteNote' webui/STATUS.md
grep -qE 'phase2048|through 2048|e2e-phase2048' webui/STATUS.md
echo "STATUS soft_complete_note sessionStorage ok"
echo "cleaned"
echo "OK: phase2044 e2e passed"
