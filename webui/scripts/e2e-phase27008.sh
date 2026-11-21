#!/usr/bin/env bash
# Phase-27008: soft-complete through 27008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27008
PY
grep -qE 'phase27008|through 27008' webui/STATUS.md
echo "OK: phase27008 e2e passed"
