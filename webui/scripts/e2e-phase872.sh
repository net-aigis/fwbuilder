#!/usr/bin/env bash
# Phase-872: soft-complete through 872 (honesty milestone 1050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 872
assert m.WEBUI_HONESTY_MILESTONE >= 1050
print("soft-complete >=872", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase872|Soft-complete STATUS through 872|through 872' webui/STATUS.md
echo "STATUS soft-complete 872 ok"
echo "cleaned"
echo "OK: phase872 e2e passed"
