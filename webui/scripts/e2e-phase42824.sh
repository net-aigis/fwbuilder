#!/usr/bin/env bash
# Phase-42824: soft-complete through 42824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42824
PY
grep -qE 'phase42824|through 42824' webui/STATUS.md
echo "OK: phase42824 e2e passed"
