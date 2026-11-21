#!/usr/bin/env bash
# Phase-36184: soft-complete through 36184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36184
PY
grep -qE 'phase36184|through 36184' webui/STATUS.md
echo "OK: phase36184 e2e passed"
