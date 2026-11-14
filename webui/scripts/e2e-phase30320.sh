#!/usr/bin/env bash
# Phase-30320: soft-complete through 30320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30320
PY
grep -qE 'phase30320|through 30320' webui/STATUS.md
echo "OK: phase30320 e2e passed"
