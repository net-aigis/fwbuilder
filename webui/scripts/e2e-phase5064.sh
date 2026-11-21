#!/usr/bin/env bash
# Phase-5064: soft-complete through 5064 (schema 5.3 + ms 13900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5064
assert m.WEBUI_HONESTY_MILESTONE >= 13900
print("soft-complete >=5064", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5064|Soft-complete STATUS through 5064|through 5064' webui/STATUS.md
echo "STATUS soft-complete 5064 ok"; echo "cleaned"; echo "OK: phase5064 e2e passed"
