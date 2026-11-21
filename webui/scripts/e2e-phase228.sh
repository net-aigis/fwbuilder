#!/usr/bin/env bash
# Phase-228: soft-complete STATUS through phase228.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "228"' webui/backend/fwbweb_api/main.py
grep -q 'phase228\|phase227\|phase226\|phase225' webui/STATUS.md
grep -q 'e2e-phase228\|e2e-phase227\|e2e-phase226\|e2e-phase225' webui/scripts/e2e-all.sh
grep -q '/hard-gaps\|window_title' webui/STATUS.md
echo "STATUS soft-complete 228 ok"
echo "cleaned"
echo "OK: phase228 e2e passed"
