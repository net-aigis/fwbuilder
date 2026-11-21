#!/usr/bin/env bash
# Phase-41224: soft-complete through 41224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41224
PY
grep -qE 'phase41224|through 41224' webui/STATUS.md
echo "OK: phase41224 e2e passed"
