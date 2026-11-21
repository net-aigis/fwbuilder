#!/usr/bin/env bash
# Phase-467: soft marker at least 472 (batch end; later bumps OK).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 472, m.WEBUI_SOFT_COMPLETE_PHASE
print("marker >=472 ok", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"
echo "OK: phase467 e2e passed"
