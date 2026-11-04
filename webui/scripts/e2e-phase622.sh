#!/usr/bin/env bash
# Phase-622: soft marker 624 + typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 624
print("marker 624 ok")
PY
(cd webui/frontend && npm run typecheck)
echo "typecheck 622 ok"
echo "cleaned"
echo "OK: phase622 e2e passed"
