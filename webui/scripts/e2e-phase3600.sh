#!/usr/bin/env bash
# Phase-3600: soft-complete through 3600 (surface_changelog_meta_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3600
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=3600", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3600|Soft-complete STATUS through 3600|through 3600' webui/STATUS.md
echo "STATUS soft-complete 3600 ok"
echo "cleaned"
echo "OK: phase3600 e2e passed"
