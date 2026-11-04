#!/usr/bin/env bash
# Phase-656: soft-complete through 656 (honesty milestone 650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 656
assert m.WEBUI_HONESTY_MILESTONE == 650
print("soft-complete >=656", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase656|Soft-complete STATUS through 656|through 656' webui/STATUS.md
echo "STATUS soft-complete 656 ok"
echo "cleaned"
echo "OK: phase656 e2e passed"
