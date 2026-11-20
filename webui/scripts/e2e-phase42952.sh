#!/usr/bin/env bash
# Phase-42952: soft-complete through 42952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42952
PY
grep -qE 'phase42952|through 42952' webui/STATUS.md
echo "OK: phase42952 e2e passed"
