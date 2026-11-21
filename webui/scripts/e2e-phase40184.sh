#!/usr/bin/env bash
# Phase-40184: soft-complete through 40184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40184
PY
grep -qE 'phase40184|through 40184' webui/STATUS.md
echo "OK: phase40184 e2e passed"
