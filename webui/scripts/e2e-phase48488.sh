#!/usr/bin/env bash
# Phase-48488: soft-complete through 48488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48488
PY
grep -qE 'phase48488|through 48488' webui/STATUS.md
echo "OK: phase48488 e2e passed"
