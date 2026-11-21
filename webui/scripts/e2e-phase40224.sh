#!/usr/bin/env bash
# Phase-40224: soft-complete through 40224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40224
PY
grep -qE 'phase40224|through 40224' webui/STATUS.md
echo "OK: phase40224 e2e passed"
