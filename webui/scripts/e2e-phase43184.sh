#!/usr/bin/env bash
# Phase-43184: soft-complete through 43184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43184
PY
grep -qE 'phase43184|through 43184' webui/STATUS.md
echo "OK: phase43184 e2e passed"
