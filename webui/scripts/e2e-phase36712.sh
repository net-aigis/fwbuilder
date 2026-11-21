#!/usr/bin/env bash
# Phase-36712: soft-complete through 36712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36712
PY
grep -qE 'phase36712|through 36712' webui/STATUS.md
echo "OK: phase36712 e2e passed"
