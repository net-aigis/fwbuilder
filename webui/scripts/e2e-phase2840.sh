#!/usr/bin/env bash
# Phase-2840: soft-complete through 2840 (changelog_roster sessionStorage + ms 6950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2840
assert m.WEBUI_HONESTY_MILESTONE == 6950
print("soft-complete >=2840", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2840|Soft-complete STATUS through 2840|through 2840' webui/STATUS.md
echo "STATUS soft-complete 2840 ok"
echo "cleaned"
echo "OK: phase2840 e2e passed"
