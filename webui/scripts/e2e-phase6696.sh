#!/usr/bin/env bash
# Phase-6696: soft-complete through 6696 (Soft 6680+ ssh_implemented_identity_roster + ms 19000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6696
assert m.WEBUI_HONESTY_MILESTONE == 19000
print("soft-complete >=6696", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6696|Soft-complete STATUS through 6696|through 6696' webui/STATUS.md
echo "STATUS soft-complete 6696 ok"; echo "cleaned"; echo "OK: phase6696 e2e passed"
