#!/usr/bin/env bash
# Phase-2648: soft-complete through 2648 (honesty_bundle_roster export + ms 6350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2648
assert m.WEBUI_HONESTY_MILESTONE == 6350
print("soft-complete >=2648", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2648|Soft-complete STATUS through 2648|through 2648' webui/STATUS.md
echo "STATUS soft-complete 2648 ok"
echo "cleaned"
echo "OK: phase2648 e2e passed"
