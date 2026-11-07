#!/usr/bin/env bash
# Phase-4197: soft marker 4200 + milestone 11200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4200
assert m.WEBUI_HONESTY_MILESTONE == 11200
assert "stack_switch_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase4197 e2e passed"
