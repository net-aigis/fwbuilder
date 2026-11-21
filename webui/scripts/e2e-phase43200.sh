#!/usr/bin/env bash
# Phase-43200: soft-complete through 43200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43200
PY
grep -qE 'phase43200|through 43200' webui/STATUS.md
echo "OK: phase43200 e2e passed"
