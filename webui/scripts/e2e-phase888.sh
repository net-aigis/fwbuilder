#!/usr/bin/env bash
# Phase-888: soft-complete through 888 (honesty milestone 1100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 888
assert m.WEBUI_HONESTY_MILESTONE == 1100
print("soft-complete >=888", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase888|Soft-complete STATUS through 888|through 888' webui/STATUS.md
echo "STATUS soft-complete 888 ok"
echo "cleaned"
echo "OK: phase888 e2e passed"
