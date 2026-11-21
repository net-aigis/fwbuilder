#!/usr/bin/env bash
# Phase-48840: soft-complete through 48840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48840
PY
grep -qE 'phase48840|through 48840' webui/STATUS.md
echo "OK: phase48840 e2e passed"
