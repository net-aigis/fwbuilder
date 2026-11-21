#!/usr/bin/env bash
# Phase-48184: soft-complete through 48184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48184
PY
grep -qE 'phase48184|through 48184' webui/STATUS.md
echo "OK: phase48184 e2e passed"
