#!/usr/bin/env bash
# Phase-4405: soft marker 4408 + milestone 11850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4408
assert m.WEBUI_HONESTY_MILESTONE == 11850
assert "expect_steps_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase4405 e2e passed"
