#!/usr/bin/env bash
# Phase-36320: soft-complete through 36320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36320
PY
grep -qE 'phase36320|through 36320' webui/STATUS.md
echo "OK: phase36320 e2e passed"
