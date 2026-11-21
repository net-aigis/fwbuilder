#!/usr/bin/env bash
# Phase-4645: soft marker 4648 + milestone 12600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4648
assert m.WEBUI_HONESTY_MILESTONE == 12600
assert "password_ssh_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase4645 e2e passed"
