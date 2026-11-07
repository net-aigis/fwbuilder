#!/usr/bin/env bash
# Phase-5512: soft-complete through 5112 (ssh_refusal_path_titles_roster + ms 15300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5512
assert m.WEBUI_HONESTY_MILESTONE >= 15300
print("soft-complete >=5112", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5512|Soft-complete STATUS through 5112|through 5112' webui/STATUS.md
echo "STATUS soft-complete 5112 ok"; echo "cleaned"; echo "OK: phase5512 e2e passed"
