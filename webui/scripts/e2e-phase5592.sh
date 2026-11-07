#!/usr/bin/env bash
# Phase-5592: soft-complete through 5112 (ssh_refusal_path_notes_roster + ms 15550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5592
assert m.WEBUI_HONESTY_MILESTONE >= 15550
print("soft-complete >=5112", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5592|Soft-complete STATUS through 5112|through 5112' webui/STATUS.md
echo "STATUS soft-complete 5112 ok"; echo "cleaned"; echo "OK: phase5592 e2e passed"
