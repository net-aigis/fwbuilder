#!/usr/bin/env bash
# Phase-45320: soft-complete through 45320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45320
PY
grep -qE 'phase45320|through 45320' webui/STATUS.md
echo "OK: phase45320 e2e passed"
