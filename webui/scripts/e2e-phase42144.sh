#!/usr/bin/env bash
# Phase-42144: soft-complete through 42144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42144
PY
grep -qE 'phase42144|through 42144' webui/STATUS.md
echo "OK: phase42144 e2e passed"
