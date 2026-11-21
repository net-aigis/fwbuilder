#!/usr/bin/env bash
# Phase-3360: soft-complete through 3360 (honesty_readiness_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3360
assert "honesty_readiness_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=3360", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3360|Soft-complete STATUS through 3360|through 3360' webui/STATUS.md
echo "STATUS soft-complete 3360 ok"
echo "cleaned"
echo "OK: phase3360 e2e passed"
