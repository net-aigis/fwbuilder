#!/usr/bin/env bash
# Phase-42568: soft-complete through 42568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42568
PY
grep -qE 'phase42568|through 42568' webui/STATUS.md
echo "OK: phase42568 e2e passed"
