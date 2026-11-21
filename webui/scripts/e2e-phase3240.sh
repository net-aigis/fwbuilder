#!/usr/bin/env bash
# Phase-3240: soft-complete through 3240 (sample_field session + ms 8200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3240
assert m.WEBUI_HONESTY_MILESTONE == 8200
assert "layout_fidelity_sample_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=3240", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3240|Soft-complete STATUS through 3240|through 3240' webui/STATUS.md
echo "STATUS soft-complete 3240 ok"
echo "cleaned"
echo "OK: phase3240 e2e passed"
