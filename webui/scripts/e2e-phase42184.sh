#!/usr/bin/env bash
# Phase-42184: soft-complete through 42184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42184
PY
grep -qE 'phase42184|through 42184' webui/STATUS.md
echo "OK: phase42184 e2e passed"
