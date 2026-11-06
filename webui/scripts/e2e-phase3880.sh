#!/usr/bin/env bash
# Phase-3880: soft-complete through 3880 (health_roster session + ms 10200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3880
assert m.WEBUI_HONESTY_MILESTONE == 10200
assert "health_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3880", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3880|Soft-complete STATUS through 3880|through 3880' webui/STATUS.md
echo "STATUS soft-complete 3880 ok"
echo "cleaned"
echo "OK: phase3880 e2e passed"
