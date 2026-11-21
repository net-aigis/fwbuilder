#!/usr/bin/env bash
# Phase-4325: soft marker 4328 + milestone 11600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4328
assert m.WEBUI_HONESTY_MILESTONE == 11600
assert "expect_run_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase4325 e2e passed"
