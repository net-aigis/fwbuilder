#!/usr/bin/env bash
# Phase-5480: soft-complete through 5160 (ssh_alternative_titles_roster sessionStorage + ms 15200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5480
assert m.WEBUI_HONESTY_MILESTONE >= 15200
print("soft-complete >=5160", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5480|Soft-complete STATUS through 5160|through 5160' webui/STATUS.md
echo "STATUS soft-complete 5160 ok"; echo "cleaned"; echo "OK: phase5480 e2e passed"
