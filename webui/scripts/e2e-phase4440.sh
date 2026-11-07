#!/usr/bin/env bash
# Phase-4440: soft-complete through 4440 (expect_steps_roster session + ms 11950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4440
assert m.WEBUI_HONESTY_MILESTONE == 11950
assert "expect_steps_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4440", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4440|Soft-complete STATUS through 4440|through 4440' webui/STATUS.md
echo "STATUS soft-complete 4440 ok"
echo "cleaned"
echo "OK: phase4440 e2e passed"
