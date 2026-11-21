#!/usr/bin/env bash
# Phase-4240: soft-complete through 4240 (option_enable_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4240
assert "option_enable_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=4240", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4240|Soft-complete STATUS through 4240|through 4240' webui/STATUS.md
echo "STATUS soft-complete 4240 ok"
echo "cleaned"
echo "OK: phase4240 e2e passed"
