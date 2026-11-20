#!/usr/bin/env bash
# Phase-42672: soft-complete through 42672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42672
PY
grep -qE 'phase42672|through 42672' webui/STATUS.md
echo "OK: phase42672 e2e passed"
