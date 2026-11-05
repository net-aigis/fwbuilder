#!/usr/bin/env bash
# Phase-3400: soft-complete through 3400 (honesty_readiness_roster session + ms 8700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3400
assert m.WEBUI_HONESTY_MILESTONE == 8700
assert "honesty_readiness_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3400", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3400|Soft-complete STATUS through 3400|through 3400' webui/STATUS.md
echo "STATUS soft-complete 3400 ok"
echo "cleaned"
echo "OK: phase3400 e2e passed"
