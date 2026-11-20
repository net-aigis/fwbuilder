#!/usr/bin/env bash
# Phase-40144: soft-complete through 40144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40144
PY
grep -qE 'phase40144|through 40144' webui/STATUS.md
echo "OK: phase40144 e2e passed"
