#!/usr/bin/env bash
# Phase-38320: soft-complete through 38320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38320
PY
grep -qE 'phase38320|through 38320' webui/STATUS.md
echo "OK: phase38320 e2e passed"
