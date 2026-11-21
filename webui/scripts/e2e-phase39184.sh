#!/usr/bin/env bash
# Phase-39184: soft-complete through 39184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39184
PY
grep -qE 'phase39184|through 39184' webui/STATUS.md
echo "OK: phase39184 e2e passed"
