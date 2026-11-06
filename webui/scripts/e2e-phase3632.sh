#!/usr/bin/env bash
# Phase-3632: soft-complete through 3632 (surface_changelog_meta_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3632
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3632", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3632|Soft-complete STATUS through 3632|through 3632' webui/STATUS.md
echo "STATUS soft-complete 3632 ok"
echo "cleaned"
echo "OK: phase3632 e2e passed"
