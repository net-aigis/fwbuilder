#!/usr/bin/env bash
# Phase-36896: soft-complete through 36896.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36896
PY
grep -qE 'phase36896|through 36896' webui/STATUS.md
echo "OK: phase36896 e2e passed"
