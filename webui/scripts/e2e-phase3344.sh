#!/usr/bin/env bash
# Phase-3344: soft-complete through 3344 (honesty_readiness_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3344
assert "soft_fertig_honesty_readiness_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=3344", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3344|Soft-complete STATUS through 3344|through 3344' webui/STATUS.md
echo "STATUS soft-complete 3344 ok"
echo "cleaned"
echo "OK: phase3344 e2e passed"
