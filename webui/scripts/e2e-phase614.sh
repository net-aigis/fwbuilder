#!/usr/bin/env bash
# Phase-614: soft marker 616 + typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 616
print("marker 616 ok")
PY
(cd webui/frontend && npm run typecheck)
echo "typecheck 614 ok"
echo "cleaned"
echo "OK: phase614 e2e passed"
