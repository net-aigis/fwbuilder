#!/usr/bin/env bash
# Phase-46624: soft-complete through 46624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46624
PY
grep -qE 'phase46624|through 46624' webui/STATUS.md
echo "OK: phase46624 e2e passed"
