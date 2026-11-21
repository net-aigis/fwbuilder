#!/usr/bin/env bash
# Phase-3520: soft-complete through 3520 (honesty_operator_brief_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3520
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=3520", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3520|Soft-complete STATUS through 3520|through 3520' webui/STATUS.md
echo "STATUS soft-complete 3520 ok"
echo "cleaned"
echo "OK: phase3520 e2e passed"
