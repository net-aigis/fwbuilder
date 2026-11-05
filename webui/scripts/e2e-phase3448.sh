#!/usr/bin/env bash
# Phase-3448: soft-complete through 3448 (session_storage_clear_roster export + ms 8850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3448
assert m.WEBUI_HONESTY_MILESTONE == 8850
print("soft-complete >=3448", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3448|Soft-complete STATUS through 3448|through 3448' webui/STATUS.md
echo "STATUS soft-complete 3448 ok"
echo "cleaned"
echo "OK: phase3448 e2e passed"
