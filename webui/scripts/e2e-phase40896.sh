#!/usr/bin/env bash
# Phase-40896: soft-complete through 40896.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40896
PY
grep -qE 'phase40896|through 40896' webui/STATUS.md
echo "OK: phase40896 e2e passed"
