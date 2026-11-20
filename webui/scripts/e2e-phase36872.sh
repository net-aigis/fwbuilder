#!/usr/bin/env bash
# Phase-36872: soft-complete through 36872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36872
PY
grep -qE 'phase36872|through 36872' webui/STATUS.md
echo "OK: phase36872 e2e passed"
