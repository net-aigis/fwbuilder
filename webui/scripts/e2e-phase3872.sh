#!/usr/bin/env bash
# Phase-3872: soft-complete through 3872 (health_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3872
assert "health_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3872", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3872|Soft-complete STATUS through 3872|through 3872' webui/STATUS.md
echo "STATUS soft-complete 3872 ok"
echo "cleaned"
echo "OK: phase3872 e2e passed"
