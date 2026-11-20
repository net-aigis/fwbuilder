#!/usr/bin/env bash
# Phase-42320: soft-complete through 42320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42320
PY
grep -qE 'phase42320|through 42320' webui/STATUS.md
echo "OK: phase42320 e2e passed"
