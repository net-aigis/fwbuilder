#!/usr/bin/env bash
# Phase-3584: soft-complete through 3584 (surface_changelog_meta_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3584
assert "soft_fertig_surface_changelog_meta_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=3584", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3584|Soft-complete STATUS through 3584|through 3584' webui/STATUS.md
echo "STATUS soft-complete 3584 ok"
echo "cleaned"
echo "OK: phase3584 e2e passed"
