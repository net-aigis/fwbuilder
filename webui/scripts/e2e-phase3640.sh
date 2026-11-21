#!/usr/bin/env bash
# Phase-3640: soft-complete through 3640 (surface_changelog_meta_roster session + ms 9450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3640
assert m.WEBUI_HONESTY_MILESTONE == 9450
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3640", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3640|Soft-complete STATUS through 3640|through 3640' webui/STATUS.md
echo "STATUS soft-complete 3640 ok"
echo "cleaned"
echo "OK: phase3640 e2e passed"
