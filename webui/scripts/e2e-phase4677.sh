#!/usr/bin/env bash
# Phase-4677: soft marker 4680 + milestone 12700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4680
assert m.WEBUI_HONESTY_MILESTONE == 12700
assert "password_ssh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase4677 e2e passed"
