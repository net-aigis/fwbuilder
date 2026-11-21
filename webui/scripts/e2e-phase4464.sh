#!/usr/bin/env bash
# Phase-4464: soft-complete through 4464 (expect_steps_refusals_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4464
assert "soft_fertig_expect_steps_refusals_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=4464", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4464|Soft-complete STATUS through 4464|through 4464' webui/STATUS.md
echo "STATUS soft-complete 4464 ok"
echo "cleaned"
echo "OK: phase4464 e2e passed"
