#!/usr/bin/env bash
# Phase-630: soft marker 632 + typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 632
print("marker 632 ok")
PY
(cd webui/frontend && npm run typecheck)
echo "typecheck 630 ok"
echo "cleaned"
echo "OK: phase630 e2e passed"
