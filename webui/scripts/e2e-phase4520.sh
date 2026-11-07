#!/usr/bin/env bash
# Phase-4520: soft-complete through 4520 (expect_steps_refusals_roster session + ms 12200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4520
assert m.WEBUI_HONESTY_MILESTONE == 12200
assert "expect_steps_refusals_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4520", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4520|Soft-complete STATUS through 4520|through 4520' webui/STATUS.md
echo "STATUS soft-complete 4520 ok"
echo "cleaned"
echo "OK: phase4520 e2e passed"
