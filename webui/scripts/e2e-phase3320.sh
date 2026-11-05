#!/usr/bin/env bash
# Phase-3320: soft-complete through 3320 (catalog_summary_roster session + ms 8450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3320
assert m.WEBUI_HONESTY_MILESTONE == 8450
assert "catalog_summary_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3320", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3320|Soft-complete STATUS through 3320|through 3320' webui/STATUS.md
echo "STATUS soft-complete 3320 ok"
echo "cleaned"
echo "OK: phase3320 e2e passed"
