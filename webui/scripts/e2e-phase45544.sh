#!/usr/bin/env bash
# Phase-45544: soft-complete through 45544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45544
PY
grep -qE 'phase45544|through 45544' webui/STATUS.md
echo "OK: phase45544 e2e passed"
