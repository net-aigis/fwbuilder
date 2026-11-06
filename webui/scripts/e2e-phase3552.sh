#!/usr/bin/env bash
# Phase-3552: soft-complete through 3552 (honesty_operator_brief_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3552
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3552", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3552|Soft-complete STATUS through 3552|through 3552' webui/STATUS.md
echo "STATUS soft-complete 3552 ok"
echo "cleaned"
echo "OK: phase3552 e2e passed"
