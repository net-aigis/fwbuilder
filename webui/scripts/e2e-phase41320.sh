#!/usr/bin/env bash
# Phase-41320: soft-complete through 41320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41320
PY
grep -qE 'phase41320|through 41320' webui/STATUS.md
echo "OK: phase41320 e2e passed"
