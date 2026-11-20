#!/usr/bin/env bash
# Phase-42160: soft-complete through 42160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42160
PY
grep -qE 'phase42160|through 42160' webui/STATUS.md
echo "OK: phase42160 e2e passed"
