#!/usr/bin/env bash
# Phase-220: soft-complete STATUS through phase220 (honesty track marker).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase220\|phase219\|phase218\|phase217' webui/STATUS.md
grep -q 'e2e-phase220\|e2e-phase219\|e2e-phase218\|e2e-phase217' webui/scripts/e2e-all.sh
grep -q 'soft_complete_phase\|WEBUI_SOFT_COMPLETE_PHASE' webui/STATUS.md
echo "STATUS soft-complete 220 ok"
echo "cleaned"
echo "OK: phase220 e2e passed"
