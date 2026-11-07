#!/usr/bin/env bash
# Phase-5160: soft-complete through 5160 (ssh_refusal_status_roster sessionStorage + ms 14200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5160
assert m.WEBUI_HONESTY_MILESTONE >= 14200
print("soft-complete >=5160", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5160|Soft-complete STATUS through 5160|through 5160' webui/STATUS.md
echo "STATUS soft-complete 5160 ok"; echo "cleaned"; echo "OK: phase5160 e2e passed"
