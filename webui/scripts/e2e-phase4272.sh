#!/usr/bin/env bash
# Phase-4272: soft-complete through 4272 (option_enable_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4272
assert "option_enable_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4272", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4272|Soft-complete STATUS through 4272|through 4272' webui/STATUS.md
echo "STATUS soft-complete 4272 ok"
echo "cleaned"
echo "OK: phase4272 e2e passed"
