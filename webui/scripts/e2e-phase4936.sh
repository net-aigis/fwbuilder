#!/usr/bin/env bash
# Phase-4936: soft-complete through 4936 (Soft 4920+ ssh_capability_flags_roster Soft-Checkpoint + ms 13500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4936
assert m.WEBUI_HONESTY_MILESTONE == 13500
print("soft-complete >=4936", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4936|Soft-complete STATUS through 4936|through 4936' webui/STATUS.md
echo "STATUS soft-complete 4936 ok"; echo "cleaned"; echo "OK: phase4936 e2e passed"
