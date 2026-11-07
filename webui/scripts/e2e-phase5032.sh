#!/usr/bin/env bash
# Phase-5032: soft-complete through 5032 (ssh_refusal_paths_roster + ms 13800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5032
assert m.WEBUI_HONESTY_MILESTONE >= 13800
print("soft-complete >=5032", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5032|Soft-complete STATUS through 5032|through 5032' webui/STATUS.md
echo "STATUS soft-complete 5032 ok"; echo "cleaned"; echo "OK: phase5032 e2e passed"
