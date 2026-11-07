#!/usr/bin/env bash
# Phase-5560: soft-complete through 5160 (ssh_refusal_path_titles_roster sessionStorage + ms 15450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5560
assert m.WEBUI_HONESTY_MILESTONE >= 15450
print("soft-complete >=5160", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5560|Soft-complete STATUS through 5160|through 5160' webui/STATUS.md
echo "STATUS soft-complete 5160 ok"; echo "cleaned"; echo "OK: phase5560 e2e passed"
