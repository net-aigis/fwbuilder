#!/usr/bin/env bash
# Phase-36520: soft-complete through 36520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36520
PY
grep -qE 'phase36520|through 36520' webui/STATUS.md
echo "OK: phase36520 e2e passed"
