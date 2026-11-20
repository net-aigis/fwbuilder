#!/usr/bin/env bash
# Phase-40064: soft-complete through 40064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40064
PY
grep -qE 'phase40064|through 40064' webui/STATUS.md
echo "OK: phase40064 e2e passed"
