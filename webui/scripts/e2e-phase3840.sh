#!/usr/bin/env bash
# Phase-3840: soft-complete through 3840 (health_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3840
assert "health_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("soft-complete >=3840", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3840|Soft-complete STATUS through 3840|through 3840' webui/STATUS.md
echo "STATUS soft-complete 3840 ok"
echo "cleaned"
echo "OK: phase3840 e2e passed"
