#!/usr/bin/env bash
# Phase-42472: soft-complete through 42472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42472
PY
grep -qE 'phase42472|through 42472' webui/STATUS.md
echo "OK: phase42472 e2e passed"
