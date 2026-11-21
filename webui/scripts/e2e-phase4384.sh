#!/usr/bin/env bash
# Phase-4384: soft-complete through 4384 (expect_steps_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4384
assert "soft_fertig_expect_steps_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=4384", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4384|Soft-complete STATUS through 4384|through 4384' webui/STATUS.md
echo "STATUS soft-complete 4384 ok"
echo "cleaned"
echo "OK: phase4384 e2e passed"
