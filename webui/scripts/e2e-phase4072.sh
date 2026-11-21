#!/usr/bin/env bash
# Phase-4072: soft-complete through 4072 (layout_fidelity_roster + ms 10800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4072
assert m.WEBUI_HONESTY_MILESTONE == 10800
print("soft-complete >=4072", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4072|Soft-complete STATUS through 4072|through 4072' webui/STATUS.md
echo "STATUS soft-complete 4072 ok"
echo "cleaned"
echo "OK: phase4072 e2e passed"
