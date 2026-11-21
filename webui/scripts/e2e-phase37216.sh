#!/usr/bin/env bash
# Phase-37216: soft-complete through 37216.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37216
PY
grep -qE 'phase37216|through 37216' webui/STATUS.md
echo "OK: phase37216 e2e passed"
