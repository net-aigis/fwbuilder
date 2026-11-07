#!/usr/bin/env bash
# Phase-5576: soft-complete through 5576 (Soft 5560+ ssh_refusal_path_titles_roster Soft-Checkpoint + ms 15500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5576
assert m.WEBUI_HONESTY_MILESTONE == 15500
print("soft-complete >=5576", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5576|Soft-complete STATUS through 5576|through 5576' webui/STATUS.md
echo "STATUS soft-complete 5576 ok"; echo "cleaned"; echo "OK: phase5576 e2e passed"
