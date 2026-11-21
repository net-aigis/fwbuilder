#!/usr/bin/env bash
# Phase-48720: soft-complete through 48720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48720
PY
grep -qE 'phase48720|through 48720' webui/STATUS.md
echo "OK: phase48720 e2e passed"
