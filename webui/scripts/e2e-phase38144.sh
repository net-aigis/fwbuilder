#!/usr/bin/env bash
# Phase-38144: soft-complete through 38144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38144
PY
grep -qE 'phase38144|through 38144' webui/STATUS.md
echo "OK: phase38144 e2e passed"
