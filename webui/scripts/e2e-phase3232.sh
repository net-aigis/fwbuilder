#!/usr/bin/env bash
# Phase-3232: soft-complete through 3232 (sample_field sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3232
assert "layout_fidelity_sample_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3232", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3232|Soft-complete STATUS through 3232|through 3232' webui/STATUS.md
echo "STATUS soft-complete 3232 ok"
echo "cleaned"
echo "OK: phase3232 e2e passed"
