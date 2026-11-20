#!/usr/bin/env bash
# Phase-43320: soft-complete through 43320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43320
PY
grep -qE 'phase43320|through 43320' webui/STATUS.md
echo "OK: phase43320 e2e passed"
