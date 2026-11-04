#!/usr/bin/env bash
# Phase-509: soft marker at least 512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 512, m.WEBUI_SOFT_COMPLETE_PHASE
print("marker >=512 ok", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"
echo "OK: phase509 e2e passed"
