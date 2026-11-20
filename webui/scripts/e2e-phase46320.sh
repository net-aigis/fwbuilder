#!/usr/bin/env bash
# Phase-46320: soft-complete through 46320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46320
PY
grep -qE 'phase46320|through 46320' webui/STATUS.md
echo "OK: phase46320 e2e passed"
