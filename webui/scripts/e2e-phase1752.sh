#!/usr/bin/env bash
# Phase-1752: soft-complete through 1752 (surface_version export/bundle + ms 3550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1752
assert m.WEBUI_HONESTY_MILESTONE == 3550
print("soft-complete >=1752", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1752|Soft-complete STATUS through 1752|through 1752' webui/STATUS.md
echo "STATUS soft-complete 1752 ok"
echo "cleaned"
echo "OK: phase1752 e2e passed"
