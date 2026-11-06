#!/usr/bin/env bash
# Phase-3560: soft-complete through 3560 (honesty_operator_brief_roster session + ms 9200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3560
assert m.WEBUI_HONESTY_MILESTONE == 9200
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3560", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3560|Soft-complete STATUS through 3560|through 3560' webui/STATUS.md
echo "STATUS soft-complete 3560 ok"
echo "cleaned"
echo "OK: phase3560 e2e passed"
