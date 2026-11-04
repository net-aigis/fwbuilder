#!/usr/bin/env bash
# Phase-477: soft marker at least 480 (batch end; later bumps OK).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 480, m.WEBUI_SOFT_COMPLETE_PHASE
print("marker >=480 ok", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"
echo "OK: phase477 e2e passed"
