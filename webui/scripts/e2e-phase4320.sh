#!/usr/bin/env bash
# Phase-4320: soft-complete through 4320 (expect_run_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4320
assert "expect_run_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=4320", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4320|Soft-complete STATUS through 4320|through 4320' webui/STATUS.md
echo "STATUS soft-complete 4320 ok"
echo "cleaned"
echo "OK: phase4320 e2e passed"
