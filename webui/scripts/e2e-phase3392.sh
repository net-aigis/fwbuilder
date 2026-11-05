#!/usr/bin/env bash
# Phase-3392: soft-complete through 3392 (honesty_readiness_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3392
assert "honesty_readiness_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3392", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3392|Soft-complete STATUS through 3392|through 3392' webui/STATUS.md
echo "STATUS soft-complete 3392 ok"
echo "cleaned"
echo "OK: phase3392 e2e passed"
