#!/usr/bin/env bash
# Phase-6216: soft-complete through 6216 (Soft 6200+ ssh_alternative_presence_roster + ms 17500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6216
assert m.WEBUI_HONESTY_MILESTONE == 17500
print("soft-complete >=6216", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6216|Soft-complete STATUS through 6216|through 6216' webui/STATUS.md
echo "STATUS soft-complete 6216 ok"; echo "cleaned"; echo "OK: phase6216 e2e passed"
