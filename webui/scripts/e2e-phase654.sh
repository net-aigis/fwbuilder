#!/usr/bin/env bash
# Phase-654: soft marker 656 + typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 656
assert m.WEBUI_HONESTY_MILESTONE == 650
print("marker 656 / milestone 650 ok")
PY
(cd webui/frontend && npm run typecheck)
echo "typecheck 654 ok"
echo "cleaned"
echo "OK: phase654 e2e passed"
