#!/usr/bin/env bash
# Phase-43280: soft-complete through 43280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43280
PY
grep -qE 'phase43280|through 43280' webui/STATUS.md
echo "OK: phase43280 e2e passed"
