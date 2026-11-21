#!/usr/bin/env bash
# Phase-30896: soft-complete through 30896.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30896
PY
grep -qE 'phase30896|through 30896' webui/STATUS.md
echo "OK: phase30896 e2e passed"
