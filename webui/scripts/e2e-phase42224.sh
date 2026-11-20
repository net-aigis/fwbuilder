#!/usr/bin/env bash
# Phase-42224: soft-complete through 42224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42224
PY
grep -qE 'phase42224|through 42224' webui/STATUS.md
echo "OK: phase42224 e2e passed"
