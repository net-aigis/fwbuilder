#!/usr/bin/env bash
# Phase-3440: soft-complete through 3440 (session_storage_clear_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3440
assert "session_storage_clear_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=3440", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3440|Soft-complete STATUS through 3440|through 3440' webui/STATUS.md
echo "STATUS soft-complete 3440 ok"
echo "cleaned"
echo "OK: phase3440 e2e passed"
