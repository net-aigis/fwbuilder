#!/usr/bin/env bash
# Phase-3413: soft marker 3416 + milestone 8750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3416
assert m.WEBUI_HONESTY_MILESTONE == 8750
assert "honesty_readiness_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3413 e2e passed"
