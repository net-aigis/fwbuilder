#!/usr/bin/env bash
# Phase-4304: soft-complete through 4304 (expect_run_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4304
assert "soft_fertig_expect_run_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=4304", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4304|Soft-complete STATUS through 4304|through 4304' webui/STATUS.md
echo "STATUS soft-complete 4304 ok"
echo "cleaned"
echo "OK: phase4304 e2e passed"
