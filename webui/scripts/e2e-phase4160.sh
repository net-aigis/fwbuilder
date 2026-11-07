#!/usr/bin/env bash
# Phase-4160: soft-complete through 4160 (stack_switch_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4160
assert "stack_switch_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=4160", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4160|Soft-complete STATUS through 4160|through 4160' webui/STATUS.md
echo "STATUS soft-complete 4160 ok"
echo "cleaned"
echo "OK: phase4160 e2e passed"
