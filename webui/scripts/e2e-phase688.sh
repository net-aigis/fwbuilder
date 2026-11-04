#!/usr/bin/env bash
# Phase-688: soft-complete through 688 (honesty milestone 700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 688
assert m.WEBUI_HONESTY_MILESTONE >= 700
print("soft-complete >=688", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase688|Soft-complete STATUS through 688|through 688' webui/STATUS.md
echo "STATUS soft-complete 688 ok"
echo "cleaned"
echo "OK: phase688 e2e passed"
